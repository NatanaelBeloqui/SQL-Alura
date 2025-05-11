-- Papel dos fornecedores na Black Friday
SELECT SUM(Qtd_Vendas)
FROM (
  SELECT strftime('%Y/%m', v.data_venda) AS "Ano/Mes",
    f.nome AS Nome_Fornecedor,
    COUNT(iv.produto_id) AS Qtd_Vendas
  FROM itens_venda as iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  JOIN produtos p ON p.id_produto = iv.produto_id
  JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
  GROUP BY Nome_Fornecedor, "Ano/Mes"
  ORDER BY "Ano/Mes", Qtd_Vendas
  )
;

-- Categorias de produtos na Black Friday
SELECT strftime('%Y', v.data_venda) as "Ano",
  c.nome_categoria as Categorias,
  COUNT(iv.produto_id) as Qtd_Vendas
FROM itens_venda as iv
JOIN vendas as v on v.id_venda = iv.venda_id
join produtos as p on p.id_produto = iv.produto_id
JOIN categorias as c on c.id_categoria = p.categoria_id
WHERE strftime('%m', v.id_venda) = '11'
GROUP BY Categorias, "Ano"
order by "Ano", Qtd_Vendas DESC;
