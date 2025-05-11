 SELECT strftime('%Y/%m', v.data_venda) AS "Ano/Mes",
  COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda as iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
WHERE f.nome = 'NebulaNetworks'
GROUP BY f.nome, "Ano/Mes"
ORDER BY "Ano/Mes", Qtd_Vendas
;
