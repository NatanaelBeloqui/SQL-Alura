-- Quadro Geral
SELECT
  strftime('%Y/%m', data_venda) as Mes,
  strftime('%Y', data_venda) as Ano,
  COUNT(*) as Qtd_Vendas
FROM 
  vendas
GROUP by
  Mes
ORDER by
  Mes;



SELECT
  Mes,
  SUM(Case WHEn Ano == '2020' then Qtd_Vendas ELSE 0 END) as '2020',
  SUM(CASE WHEn Ano == '2021' then Qtd_Vendas ELSE 0 END) as '2021',
  SUM(CASE WHEn Ano == '2022' then Qtd_Vendas ELSE 0 END) as '2022',
  SUM(CASE WHEn Ano == '2023' then Qtd_Vendas ELSE 0 END) as '2023'
FROM(
  SELECT
    strftime('%m', data_venda) as Mes,
    strftime('%Y', data_venda) as Ano,
    COUNT(*) as Qtd_Vendas
  FROM 
    vendas
  GROUP by
    Mes, Ano
  ORDER by
    Mes
)
GROUP by
  Mes;