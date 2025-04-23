SELECT id_colaborador, cargo, salario,
CASE
WHEN salario < 3000 then 'Baixo'
WHen salario BETWEEN 3000 AND 6000 THEN 'Médio'
ELSE 'Alto'
end as categoria_salario
FROM HistoricoEmprego;