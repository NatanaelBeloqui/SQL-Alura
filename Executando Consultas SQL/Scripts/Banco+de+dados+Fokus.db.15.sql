SELECT cargo, COUNT(*) qtd
FROM HistoricoEmprego
GROUP BY cargo
HAVING qtd >= 2;