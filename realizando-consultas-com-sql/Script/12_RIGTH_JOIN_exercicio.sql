-- Seu desafio é criar uma consulta
-- SQL que retorne o nome dos clientes
-- que ainda não fizeram pedidos em sua loja.

SELECT c.nome
FROM pedidos p
RIGHT JOIN clientes c
ON c.id = p.id_cliente
WHERE p.id_cliente IS NULL;