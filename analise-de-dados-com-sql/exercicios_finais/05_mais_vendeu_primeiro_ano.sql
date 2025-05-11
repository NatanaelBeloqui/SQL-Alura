-- Qual o nome do fornecedor que mais vendeu no primeiro ano disponível na base?
SELECT
  f.nome as [Fornecedorque mais vendeu]
FROM
  fornecedores as f
join
  produtos as p on p.fornecedor_id = f.id_fornecedor
join
  itens_venda as iv on iv.produto_id = p.id_produto
join
  vendas as v on v.id_venda = iv.venda_id
WHERE
  strftime('%Y', v.data_venda) = (
    SELECT
      MIN(strftime('%Y', data_venda))
    FROM 
      vendas
  )
GROUP by
  f.id_fornecedor
ORDER by
  COUNT(*) desc
LIMIT
  1;
