CREATE VIEW view_cliente as
SELECT nome, endereco
from clientes;

SELECT * from view_cliente;

CREATE VIEW view_valor_total_pedido AS 
SELECT
  p.id,
  c.nome,
  p.data_hora_pedido,
  SUM(ip.preco_unitario) AS valor_total_pedido
FROM clientes AS c
JOIN pedidos AS p ON c.id = p.id_cliente
JOIN itens_pedidos AS ip ON p.id = ip.id_pedido
GROUP BY p.id, c.nome
ORDER BY p.data_hora_pedido;

SELECT * FROM view_valor_total_pedido;
