SELECT nome, rua, bairro, cidade, estado, cep FROM colaboradores
UNION ALL -- Retorna de forma distinta, ou seja, não retorna valores repetidos
SELECT nome, rua, bairro, cidade, estado, cep FROM fornecedores;
-- Eu preciso ter os mesmos campos nas tabelas para utilizar o UNION e o UNION ALL