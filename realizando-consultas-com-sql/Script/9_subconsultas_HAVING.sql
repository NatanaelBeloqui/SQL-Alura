SELECT AVG(preco) FROM produtos;

-- HAVING é usado para valores que já foram agrupados

SELECT nome, preco
FROM produtos
GROUP BY nome, preco
HAVING preco > (
  SELECT AVG(preco) 
  FROM produtos
);