-- 1: Buscar o nome do professor e a turma que ele é orientador
SELECT p.nome_professor, t.nome_turma
FROM Professores as p
JOIN Turmas as t
on p.ID_Professor = t.ID_Professor_Orientador

-- 2: Retornar o nome e a nota do aluno que possui a melhor nota na disciplina de Matemática
SELECT a.Nome_Aluno, n.Nota
FROM Alunos as a
JOIN Notas as n on a.ID_Aluno = n.ID_Aluno
join Disciplinas as d on n.ID_Disciplina = d.ID_Disciplina
WHERE d.Nome_Disciplina = 'Matemática'
AND n.Nota = (
  SELECT MAX(n2.Nota)
  FROM Notas as n2
  join Disciplinas as d2 on n2.ID_Disciplina = d2.ID_Disciplina
  WHERE d2.Nome_Disciplina = 'Matemática'
);

-- 3: Identificar o total de alunos por turma
SELECT t.ID_Turma ,t.Nome_Turma, COUNT(ta.ID_Aluno) as total_alunos_turma
FROM Turmas as t
join Turma_Alunos as ta on t.ID_Turma = ta.ID_Turma
GROUP by t.ID_Turma, t.Nome_Turma;

-- 4: Listar os Alunos e as disciplinas em que estão matriculados
SELECT A.Nome_Aluno, D.Nome_Disciplina
from Alunos as A 
join Turma_Alunos as TA on A.ID_Aluno = TA.ID_Aluno
join Turma_Disciplinas as TD on TA.ID_Turma = TD.ID_Turma
join Disciplinas as D ON D.ID_Disciplina = TD.ID_Disciplina
ORDER BY D.Nome_Disciplina;

-- 5: Criar uma view que apresenta o nome, a disciplina e a nota dos alunos
CREATE VIEW View_Alunos_Disciplina_Nota as
SELECT a.Nome_Aluno, d.Nome_Disciplina, n.Nota
FROM Alunos as a
JOIN Notas as n on a.ID_Aluno = n.ID_Aluno
JOIN Disciplinas as d on n.ID_Disciplina = d.ID_Disciplina

SELECT * FROM View_Alunos_Disciplina_Nota;