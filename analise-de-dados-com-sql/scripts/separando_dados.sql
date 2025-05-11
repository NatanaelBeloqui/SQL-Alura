SELECT strftime('%Y', data_venda) as Ano,
  strftime('%m', data_venda) as Mes,
  COUNT(id_venda) as Total_Vendas
FROM vendas
WHERE Mes = '01'
or Mes = '11'
or Mes = '12'
GROUP by Ano, Mes
ORDER by Ano;