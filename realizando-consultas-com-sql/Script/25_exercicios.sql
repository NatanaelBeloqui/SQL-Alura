-- Exercício 01

SELECT *
FROM clientes
WHERE nome = 'Maria Silva';

-- Exercício 02

SELECT * FROM pedidos;

SELECT id as id_pedido, id_cliente
FROM pedidos
WHERE status = 'Entregue'
ORDER by id_cliente;

-- Exercício 03

SELECT * FROM produtos;

SELECT *
FROM produtos
WHERE preco > 10
AND preco < 15;

-- Exercício 04

SELECT * FROM colaboradores;

SELECT nome, cargo
FROM colaboradores
WHERE data_contratacao
BETWEEN '2022-01-01'
AND '2022-06-31';

-- Exercício 05

SELECT * FROM clientes;

SELECT *
FROM pedidos
ORDER by data_hora_pedido;

SELECT c.nome
FROM clientes as c
JOIN pedidos as p
ON c.id = p.id_cliente
WHERE data_hora_pedido = (
  SELECT MIN(data_hora_pedido)
  FROM pedidos
);

-- Exercício 06

SELECT * FROM pedidos;
SELECT * FROM itens_pedidos;
