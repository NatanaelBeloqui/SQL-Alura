SELECT p.id, c.nome, SUM(ip.preco_unitario) as valor_total_pedido
FROM clientes as c
JOIN pedidos as p on c.id = p.id_cliente
join itens_pedidos as ip on p.id = ip.id_pedido
GROUP by p.id, c.nome;