-- Primeiro, inicia a transaction com BEGIN
BEGIN TRANSACTION;

-- ou
-- BEGIN;
-- ou
-- START TRANSACTION;

-- Segundo, faz as alterações ou seja lá o que quiser fazer
SELECT *
FROM clientes;

SELECT *
FROM pedidos;

UPDATE pedidos
set status = 'Concluído'
WHERE status = 'Em Andamento';

DELETE FROM clientes;

-- Se fez algo que não queria que acontecece,
-- chama o ROLLBACK para voltar no instante que
-- foi ativado o BEGIN
ROLLBACK;

-- Se a alteração feita é o que se queria ser feito,
-- chama o COMMIT para alterar definitivamente as informações
COMMIT;