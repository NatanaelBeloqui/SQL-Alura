-- Total de produtos vendidos no ano de 2022
SELECT
	COUNT(iv.produto_id) as Qtd_Produtos_Vendidos_2022
FROM
  itens_venda as iv
join vendas as v on v.id_venda = iv.venda_id
WHERE strftime('%Y', v.data_venda) = '2022';
