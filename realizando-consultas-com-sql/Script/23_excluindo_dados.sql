SELECT * FROM colaboradores WHERE id = 3;

DELETE FROM colaboradores WHERE id = 3;

SELECT * FROM clientes;

SELECT * FROM clientes WHERE id = 27;

SELECT * from pedidos WHERE id_cliente = 27;

SELECT * FROM itens_pedidos WHERE id_pedido = 451;

on DELETE CASCADE

DELETE FROM clientes WHERE id = 27;
