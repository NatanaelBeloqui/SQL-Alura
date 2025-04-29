SELECT * FROM produtos;

SELECT pr.nome, x.id_produto, x.id_pedido
FROM(
  SELECT  ip.id_pedido, ip.id_produto
  FROM pedidos AS p
  JOIN itens_pedidos AS ip
  ON p.id = ip.id_pedido
  WHERE strftime('%m', p.data_hora_pedido) = '01' ) as x
RIGHT JOIN produtos AS pr
ON pr.id = x.id_produto;