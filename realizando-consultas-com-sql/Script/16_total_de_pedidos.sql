SELECT
  c.nome,
  SUM(ip.quantidade * ip.preco_unitario) AS valor_total
FROM clientes AS c
JOIN pedidos AS p ON c.id = p.id_cliente
JOIN itens_pedidos AS ip ON p.id = ip.id_pedido
GROUP BY c.nome;
