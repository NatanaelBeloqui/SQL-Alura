-- Habilita a validação das chaves estragneriras no SQLite
PRAGMA foreign_keys = ON

SELECT *
from produtos
WHERE id = 31;

UPDATE produtos
set preco = 13.0
WHERE id = 31;

SELECT *
from produtos
WHERE nome
LIKE 'croissant%';

UPDATE produtos
set descricao = 'Croissant recheado com amêndoas.'
WHERE id = 28;
