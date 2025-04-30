SELECT * FROM faturamento_diario;

INSERT INTO pedidos(id, id_cliente, data_hora_pedido, status)
VALUES (451, 27, '2023-10-07 14:30:00', 'Em Andamento');

SELECT * FROM pedidos;

SELECT * FROM itens_pedidos;

INSERT INTO itens_pedidos(id_pedido, id_produto, quantidade, preco_unitario)
VALUES (451, 14, 1, 6.0),
       (451, 13, 1, 7.0);
       

INSERT INTO pedidos(id, id_cliente, data_hora_pedido, status) 
VALUES (452, 28, '2023-10-07 14:35:00', 'Em Andamento');

INSERT INTO itens_pedidos(id_pedido, id_produto, quantidade, preco_unitario)
VALUES (452, 10, 1, 5.0),
       (452, 31, 1, 12.50);
       
DELETE FROM itens_pedidos
WHERE id_pedido = 452;

SELECT * FROM itens_pedidos;
