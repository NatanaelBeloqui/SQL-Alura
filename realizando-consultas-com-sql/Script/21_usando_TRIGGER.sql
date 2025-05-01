SELECT * FROM faturamento_diario;

INSERT INTO pedidos(id, id_cliente, data_hora_pedido, status)
VALUES (451, 27, '2023-10-07 14:30:00', 'Em Andamento');

SELECT * FROM pedidos;

SELECT * FROM itens_pedidos;

INSERT INTO itens_pedidos(id_pedido, id_produto, quantidade, preco_unitario)
VALUES (451, 14, 1, 6.0),
       (451, 13, 1, 7.0);

CREATE TRIGGER calcula_faturamento_diario
AFTER INSERT on itens_pedidos
for each ROW
BEGIN
DELETE FROM faturamento_diario;
INSERT into faturamento_diario (dia, faturamento_total)
SELECT DATE(data_hora_pedido) as dia, SUM(ip.preco_unitario) as faturamento_diario
FROM pedidos as p
JOIN itens_pedidos as ip
on p.id = ip.id_pedido
GROUP by dia
ORDER by dia;
END;

INSERT INTO pedidos(id, id_cliente, data_hora_pedido, status) 
VALUES (452, 28, '2023-10-07 14:35:00', 'Em Andamento');

INSERT INTO itens_pedidos(id_pedido, id_produto, quantidade, preco_unitario)
VALUES (452, 10, 1, 5.0),
       (452, 31, 1, 12.50);
       
DELETE FROM itens_pedidos
WHERE id_pedido = 452;

SELECT * FROM itens_pedidos;
