SELECT *
FROM pedidos;

SELECT *
FROM itens_pedidos;

SELECT DATE(data_hora_pedido) as dia, SUM(ip.preco_unitario) as faturamento_diario
FROM pedidos as p
JOIN itens_pedidos as ip
on p.id = ip.id_pedido
GROUP by dia
ORDER by dia;

CREATE TABLE faturamento_diario (
    dia DATE,
    faturamento_total DECIMAL(10, 2)
);

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

SELECT * FROM faturamento_diario;