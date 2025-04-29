SELECT c.nome, p.id
from clientes as c
LEFT JOIN pedidos as p
on c.id = p.id_cliente
WHERE strftime('m', p.data_hora_pedido) = '01';

SELECT p.id, p.id_cliente
from pedidos as p
WHERE strftime('m', p.data_hora_pedido) = '01';

SELECT c.nome, x.id
from clientes as c
LEFT JOIN
(
  SELECT p.id, p.id_cliente
  from pedidos p
  WHERE strftime('m', p.data_hora_pedido) = '01') as x
on c.id = x.id_cliente
WHERE x.id_cliente is NULL;