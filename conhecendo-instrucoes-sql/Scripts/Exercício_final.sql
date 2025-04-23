CREATE TABLE tabelafuncionarios (
  id_funcionario INT PRIMARY key,
  nome_funcionario VARCHAR(100),
  departamento_funcionario VARCHAR(100),
  salario_funcionario FLOAT(10, 2)
);

INSERT INTO tabelafuncionarios
(id_funcionario,
 nome_funcionario,
 departamento_funcionario,
 salario_funcionario)
 VALUES
(1, 'Heitor Vieira', 'Financeiro', 4959.22),
(2, 'Daniel Campos', 'Vendas', 3884.44),
(3, 'Luiza Dias', 'TI', 8205.78),
(4, 'Davi Lucas Moraes', 'Financeiro', 8437.02),
(5, 'Pietro Cavalcanti', 'TI', 4946.88),
(6, 'Evelyn da Mata', 'Vendas', 5278.88),
(7, 'Isabella Rocha', 'Marketing', 4006.03),
(8, 'Sra. Manuela Azevedo', 'Vendas', 6101.88),
(9, 'Brenda Cardoso', 'TI', 8853.34),
(10, 'Danilo Souza', 'TI', 8242.14);

SELECT * FROM tabelafuncionarios;

SELECT * FROM tabelafuncionarios where departamento_funcionario = 'Vendas';

SELECT * FROM tabelafuncionarios WHERE salario_funcionario > 5000;

SELECT DISTINCT departamento_funcionario FROM tabelafuncionarios;

UPDATE tabelafuncionarios set salario_funcionario = 7500 WHERE departamento_funcionario = 'TI';

SELECT * FROM tabelafuncionarios;

DELETE from tabelafuncionarios WHERE salario_funcionario < 4000;

SELECT * FROM tabelafuncionarios;

SELECT nome_funcionario, salario_funcionario
FROM tabelafuncionarios
WHERE departamento_funcionario = 'Vendas' AND salario_funcionario >= 6000;

SELECT * FROM tabelafuncionarios;

CREATE TABLE tabelaprojetos (
  id_projeto INT PRIMARY KEY,
  nome_projeto VARCHAR(100),
  id_gerente INT,
  FOREIGN KEY (id_gerente) REFERENCES tabelafuncionarios(id_funcionario)
);

INSERT INTO projetos (id_projeto, nome_projeto, id_gerente) VALUES (1, 'Projeto A', 2);

SELECT * FROM tabelaprojetos;

SELECT * FROM projetos WHERE id_gerente = 2;

-- DROP TABLE tabelafuncionarios;
-- DROP TABLE tabelaprojetos;