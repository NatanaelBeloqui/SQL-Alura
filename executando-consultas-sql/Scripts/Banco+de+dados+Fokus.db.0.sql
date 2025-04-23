SELECT * FROM HistoricoEmprego
WHERE datatermino ISNULL
order by salario DESC
LIMIT 5;