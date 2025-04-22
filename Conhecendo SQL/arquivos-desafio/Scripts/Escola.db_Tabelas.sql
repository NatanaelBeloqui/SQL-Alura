CREATE table Alunos (
  Id_Aluno INT PRIMARY KEY,
  Nome_Aluno VARCHAR(250),
  Data_de_Nasci_Aluno DATE,
  Genero_Aluno VARCHAR(10),
  Endereco_Aluno VARCHAR(250),
  Telefone_de_Contato_Aluno VARCHAR(20),
  Email_Aluno VARCHAR(255)
);

CREATE TABLE Professores (
  Id_Professor INT PRIMARY KEY,
  Nome_Professor VARCHAR(250),
  Data_de_Nasci_Professor DATE,
  Genero_Professor VARCHAR(10),
  Telefone_de_Contato_Professor VARCHAR(20),
  Email_Professor VARCHAR(255)
);

CREATE TABLE Disciplinas (
  Id_Disciplina INT PRIMARY KEY,
  Nome_Disciplina VARCHAR(250),
  Descricao_Disciplina TEXT,
  Carga_Horaria_Disciplina INT,
  Id_Professor INT,
  FOREIGN KEY (Id_Professor) REFERENCES Professores(Id_Professor)
);

CREATE TABLE Turmas (
  Id_Turma INT PRIMARY KEY,
  Nome_Turma VARCHAR(100),
  Ano_Letivo INT,
  Id_Professor_Orientador INT,
  FOREIGN KEY (Id_Professor_Orientador) REFERENCES Professores(Id_Professor)
);

CREATE TABLE Turma_Disciplinas (
  Id_Turma INT PRIMARY KEY,
  Nome_Turma VARCHAR(100),
  Ano_Letivo INT,
  Id_Professor_Orientador INT,
  FOREIGN KEY (Id_Professor_Orientador) REFERENCES Professores(Id_Professor)
);

CREATE TABLE Turma_Disciplinas (
  Id_Turma INT,
  Id_Disciplina INT,
  PRIMARY KEY (Id_Turma, Id_Disciplina),
  FOREIGN KEY (Id_Turma) REFERENCES Turmas(Id_Turma),
  FOREIGN KEY (Id_Disciplina) REFERENCES Disciplinas(Id_Disciplina)
);

CREATE TABLE Turma_Alunos (
  Id_Turma INT,
  Id_Alunos INT,
  PRIMARY KEY (Id_Turma, Id_Alunos),
  FOREIGN KEY (Id_Turma) REFERENCES Turmas(Id_Turma),
  FOREIGN KEY (Id_Alunos) REFERENCES Disciplinas(Id_Aluno)
);

CREATE TABLE Notas (
  Id_Nota INT PRIMARY KEY,
  Id_Aluno INT,
  Id_Disciplina INT,
  Valor_da_Nota FLOAT(3,2),
  Data_da_Avaliacao DATE,
  FOREIGN KEY (Id_Aluno) REFERENCES Alunos(Id_Aluno),
  FOREIGN KEY (Id_Disciplina) REFERENCES Disciplinas(Id_Disciplina)
);