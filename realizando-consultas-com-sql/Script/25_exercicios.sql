-- Exercício 01

SELECT *
FROM clientes
WHERE nome = 'Maria Silva';

-- Exercício 02

SELECT id as id_pedido, id_cliente
FROM pedidos
WHERE status = 'Entregue'
ORDER by id_cliente;

-- Exercício 03

SELECT *
FROM produtos
WHERE preco > 10
AND preco < 15;

-- Exercício 04

SELECT nome, cargo
FROM colaboradores
WHERE data_contratacao
BETWEEN '2022-01-01'
AND '2022-06-31';

-- Exercício 05

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

SELECT nome
FROM produtos
WHERE id not IN (
  SELECT id_produto
  FROM itens_pedidos
);

-- Exercício 07

SELECT DISTINCT c.nome
FROM clientes as c
JOIN pedidos as p
on c.id = p.id_cliente
WHERE data_hora_pedido
BETWEEN '2023-01-01'
AND '2023-12-31'
ORDER by c.nome;

-- Exercício 08

SELECT p.nome
FROM produtos as p
JOIN itens_pedidos as ip
on p.id = ip.id_produto
GROUP by ip.id_produto
HAVING SUM(ip.quantidade) < 15
ORDER BY CAST(ip.id_produto AS UNSIGNED);

-- Exercício 09

SELECT pr.nome AS produto, pe.id AS pedido_id
FROM clientes AS c
JOIN pedidos AS pe ON c.id = pe.id_cliente
JOIN itens_pedidos AS ip ON pe.id = ip.id_pedido
JOIN produtos AS pr ON ip.id_produto = pr.id
WHERE c.nome IN ('Pedro Alves', 'Ana Rodrigues')
ORDER BY CAST(pe.id AS UNSIGNED);

-- Exercício 10

SELECT p.id_cliente, c.nome, SUM(ip.quantidade * ip.preco_unitario) as valor_total
FROM clientes as c
JOIN pedidos as p on c.id = p.id_cliente
JOIN itens_pedidos as ip on p.id = ip.id_pedido
GROUP BY p.id_cliente
ORDER by valor_total DESC
LIMIT 1;
