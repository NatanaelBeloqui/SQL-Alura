SELECT DISTINCT(strftime('%Y', data_venda)) AS Ano
FROM vendas
ORDER by Ano;

SELECT strftime('%Y', data_venda) as Ano, COUNT(id_venda) as Total_Vendas
FROM vendas
GROUP by Ano
ORDER by Ano;

SELECT strftime('%Y', data_venda) as Ano,
  strftime('%m', data_venda) as Mes,
  COUNT(id_venda) as Total_Vendas
FROM vendas
GROUP by Ano, Mes
ORDER by Ano;