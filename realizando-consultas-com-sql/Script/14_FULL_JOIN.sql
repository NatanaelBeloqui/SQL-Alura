SELECT c.nome, p.id
FROM clientes as c
FULl join pedidos as p
on c.id = p.id_cliente
WHERE c.id is NULL
or p.id_cliente is NULL;