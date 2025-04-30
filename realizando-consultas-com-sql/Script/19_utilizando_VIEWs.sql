SELECT * FROM view_valor_total_pedido;

SELECT nome
FROM view_valor_total_pedido;

SELECT *
FROM view_valor_total_pedido
WHERE valor_total_pedido = 10;

SELECT *
FROM view_valor_total_pedido
WHERE valor_total_pedido > 10;

SELECT *
FROM view_valor_total_pedido
WHERE valor_total_pedido > 10
AND valor_total_pedido < 14;

SELECT *
FROM view_valor_total_pedido
WHERE strftime('%m', data_hora_pedido) = '04';

drop view view_cliente;
