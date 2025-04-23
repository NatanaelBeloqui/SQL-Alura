SELECT c.nome, p.id, p.data_hora_pedido
FROM clientes c
INNER JOIN pedidos p
ON c.id = p.id_cliente;

-- Quando usamos JOIN precisamos referenciar os campos