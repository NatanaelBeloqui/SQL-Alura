-- Seleciona as colunas nome da tabela clientes (apelidada como c), e id e
-- data_hora_pedido da tabela pedidos (apelidada como p).

-- Faz uma junção interna (usando o INNER JOIN) entre as tabelas clientes e
-- pedidos, relacionando-as através da condição c.id = p.id_cliente, ou seja, o id
-- da tabela clientes deve ser igual ao id_cliente da tabela pedidos.

-- O INNER JOIN retorna apenas os registros onde há correspondência entre as duas
-- tabelas (ou seja, somente clientes que têm pedidos).

SELECT c.nome, p.id, p.data_hora_pedido
FROM clientes AS c
JOIN pedidos AS p
ON c.id = p.id_cliente;

SELECT * from clientes;
SELECT * FROM pedidos;

-- Quando usamos JOIN precisamos referenciar os campos
-- O uso do AS (alias) é opcional, porém usá-lo é boa prática

