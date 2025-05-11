-- Quadro Geral
SELECT
  strftime('%Y/%m', data_venda) as "Ano/Mes",
  COUNT(*) as Qtd_Vendas
FROM vendas
GROUP by "Ano/Mes"
ORDER by "Ano/Mes";