SELECT nome, telefone
FROM clientes 
WHERE id = (
  SELECT id_cliente 
  FROM pedidos 
  WHERE data_hora_pedido = '2023-01-02 08:15:00');
  
  --Subconsultas são consultas aninhadas com outras consultas.