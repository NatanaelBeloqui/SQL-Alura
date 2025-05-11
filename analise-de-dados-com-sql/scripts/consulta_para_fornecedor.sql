-- Seleciona os campos que serão exibidos na consulta final
SELECT 
  Nome_Fornecedor, -- Nome do fornecedor
  Qtd_Vendas, -- Quantidade de vendas (número de produtos vendidos associados a este fornecedor)
  
  -- Calcula a porcentagem de vendas que este fornecedor representa em relação ao total de itens vendidos.
  -- Multiplica por 100 para obter a porcentagem e arredonda para 2 casas decimais.
  ROUND(100.0 * Qtd_Vendas / (
    SELECT 
    COUNT(*) from itens_venda), 2) || '%' as Porcentagem -- O "|| '%'" concatena o símbolo de porcentagem ao número
FROM(
  -- Subconsulta que agrupa os dados por fornecedor
  SELECT 
    f.nome as Nome_Fornecedor, -- Nome do fornecedor (renomeado como "Nome_Fornecedor")
    COUNT(iv.produto_id) as Qtd_Vendas -- Conta quantos produtos desse fornecedor foram vendidos
  FROM 
    itens_venda as iv -- Tabela de itens vendidos (detalhes de cada produto em uma venda)
  JOIN 
    vendas as v on v.id_venda = iv.venda_id -- Junta com a tabela de vendas para acessar informações da venda
  JOIN
    produtos as p on p.id_produto = iv.produto_id -- Junta com produtos para saber qual produto foi vendido
  JOIN 
    fornecedores as f on f.id_fornecedor = p.fornecedor_id -- Junta com fornecedores para saber quem forneceu o produto
  GROUP by 
    Nome_Fornecedor -- Agrupa os resultados pelo nome do fornecedor
  ORDER by 
    Qtd_Vendas DESC -- Ordena os resultados da subconsulta pela quantidade de vendas, do maior para o menor
);