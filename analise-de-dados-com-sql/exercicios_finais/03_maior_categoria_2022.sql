-- Categoria que mais vendeu em 2022
SELECT
  COUNT(id_categoria) as Qtd_Vendas,
  c.nome_categoria as Categoria
FROM itens_venda as iv
JOIN vendas as v on v.id_venda = iv.venda_id
JOIN produtos as p on p.id_produto = iv.produto_id
JOIN categorias as c on c.id_categoria = p.categoria_id
WHERE strftime('%Y', v.data_venda) = '2022'
GROUP by c.id_categoria
ORDER by Qtd_Vendas DESC
LIMIT 1;
