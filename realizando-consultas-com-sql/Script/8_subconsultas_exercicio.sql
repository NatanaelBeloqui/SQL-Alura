SELECT nome
from alunos
WHERE id_aluno = (
  SELECT id_aluno
  FROM notas
  WHERE nota = (
    SELECT MAX(nota)
    FROM notas)
);

-- SELECT * FROM notas;