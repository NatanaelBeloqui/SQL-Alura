SELECT rua, bairro, cidade, estado, cep FROM colaboradores
UNION -- Retorna todos os valores das duas tabelas, incluindo valores repetidos
SELECT rua, bairro, cidade, estado, cep FROM fornecedores;