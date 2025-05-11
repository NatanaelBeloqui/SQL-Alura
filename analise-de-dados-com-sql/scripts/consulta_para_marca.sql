-- Consulta principal que exibe a marca, quantidade de vendas e porcentagem de participação
SELECT 
    Nome_Marca, -- Nome da marca
    Qtd_Vendas, -- Quantidade de produtos vendidos dessa marca

    -- Calcula a porcentagem que essa marca representa no total de itens vendidos
    -- Multiplica por 100.0 para garantir resultado decimal
    -- Arredonda para 2 casas decimais e concatena com o símbolo de porcentagem
    ROUND(100.0 * Qtd_Vendas / (
        SELECT COUNT(*) FROM itens_venda  -- Total de itens vendidos no sistema
    ), 2) || '%' AS Porcentagem
FROM (
    -- Subconsulta que calcula quantos itens de cada marca foram vendidos
    SELECT 
        m.nome AS Nome_Marca, -- Nome da marca (renomeado para uso externo)
        COUNT(iv.produto_id) AS Qtd_Vendas -- Conta quantos produtos dessa marca foram vendidos
    FROM 
        itens_venda iv -- Tabela de itens das vendas

    -- Junta com vendas para acessar a venda a que o item pertence
    JOIN 
        vendas v ON v.id_venda = iv.venda_id 

    -- Junta com produtos para saber de qual produto se trata
    JOIN 
        produtos p ON p.id_produto = iv.produto_id 

    -- Junta com marcas para saber a marca do produto
    JOIN 
        marcas m ON m.id_marca = p.marca_id 

    -- Agrupa os resultados por nome da marca
    GROUP BY 
        Nome_Marca 

    -- Ordena as marcas com mais vendas primeiro (dentro da subconsulta)
    ORDER BY 
        Qtd_Vendas DESC
);
