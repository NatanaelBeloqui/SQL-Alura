-- Consulta principal que retorna: nome da categoria, quantidade de vendas e porcentagem de participação
SELECT 
    Nome_Categoria, -- Nome da categoria de produtos
    Qtd_Vendas,     -- Quantidade de produtos vendidos dessa categoria

    -- Calcula a porcentagem que essa categoria representa do total de itens vendidos
    -- Multiplica por 100.0 para garantir resultado decimal e arredonda para 2 casas decimais
    -- Concatena o símbolo de porcentagem ao final
    ROUND(100.0 * Qtd_Vendas / (
        SELECT COUNT(*) FROM itens_venda  -- Total de itens vendidos no sistema
    ), 2) || '%' AS Porcentagem

FROM (
    -- Subconsulta que calcula quantos itens foram vendidos por categoria
    SELECT 
        c.nome_categoria AS Nome_Categoria, -- Nome da categoria (renomeado para uso externo)
        COUNT(iv.produto_id) AS Qtd_Vendas  -- Conta quantos produtos dessa categoria foram vendidos

    FROM 
        itens_venda AS iv -- Tabela que armazena os itens das vendas

    -- Junta com a tabela de vendas para associar cada item à sua respectiva venda
    JOIN 
        vendas AS v ON v.id_venda = iv.venda_id 

    -- Junta com a tabela de produtos para saber qual produto foi vendido
    JOIN 
        produtos AS p ON p.id_produto = iv.produto_id 

    -- Junta com a tabela de categorias para identificar a categoria do produto
    JOIN 
        categorias AS c ON c.id_categoria = p.categoria_id 

    -- Agrupa os dados pelo nome da categoria
    GROUP BY 
        Nome_Categoria 

    -- Ordena os resultados pelas categorias mais vendidas primeiro
    ORDER BY
        Qtd_Vendas DESC
);
