SELECT
  c.nome_categoria as [Categorias que mais venderam]
FROM
  categorias as c
JOIN
  produtos as p ON p.categoria_id = c.id_categoria
JOIN
  itens_venda as iv on iv.produto_id = p.id_produto
JOIN
  vendas as v on v.id_venda = iv.venda_id
GROUP BY
  c.id_categoria
ORDER BY
  COUNT(*) DESC
LIMIT 2;