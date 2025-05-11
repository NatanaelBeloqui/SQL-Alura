WITH TopCategorias AS (
  SELECT 
    c.nome_categoria
  FROM 
    categorias AS c
  JOIN 
    produtos AS p ON p.categoria_id = c.id_categoria
  JOIN 
    itens_venda AS iv ON iv.produto_id = p.id_produto
  JOIN 
    vendas AS v ON v.id_venda = iv.venda_id
  GROUP BY 
    c.id_categoria
  ORDER BY 
    COUNT(*) DESC
  LIMIT 2
)

SELECT
  "Ano/Mês",
  SUM(CASE WHEN Categoria = 'Eletrônicos' THEN Qtd_Vendas ELSE 0 END) AS Eletrônicos,
  SUM(CASE WHEN Categoria = 'Vestuário' THEN Qtd_Vendas ELSE 0 END) AS Vestuário
FROM (
  SELECT
    COUNT(*) AS Qtd_Vendas, 
    strftime('%Y/%m', v.data_venda) AS "Ano/Mês",
    c.nome_categoria AS Categoria
  FROM 
    itens_venda iv
  JOIN 
    vendas AS v ON v.id_venda = iv.venda_id
  JOIN 
    produtos AS p ON p.id_produto = iv.produto_id
  JOIN 
    categorias AS c ON c.id_categoria = p.categoria_id
  WHERE 
    c.nome_categoria IN (SELECT nome_categoria FROM TopCategorias)
  GROUP BY 
    "Ano/Mês", Categoria
)
GROUP BY 
  "Ano/Mês"
ORDER BY 
  "Ano/Mês";