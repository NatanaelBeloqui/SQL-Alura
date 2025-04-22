SELECT id_colaborador, JULIANDAY (datatermino) - JULIANDAY (datacontratacao)
FROM HistoricoEmprego
WHERE datatermino is not NULL;