-- Métrica
SELECT
  COUNT(*) AS Qtd_Vendas,
  strftime('%Y', v.data_venda) as Ano
FROM
  vendas as v
WHERE
  strftime('%m', v.data_venda) = '11'
and
  Ano != '2022'
GROUP by Ano;

-- Média das vendas
SELECT
  AVG(Qtd_Vendas) as Media_Qtd_Vendas
FROM(
  SELECT
    COUNT(*) AS Qtd_Vendas,
    strftime('%Y', v.data_venda) as Ano
  FROM
    vendas as v
  WHERE
    strftime('%m', v.data_venda) = '11'
  and
    Ano != '2022'
  GROUP by Ano
);


SELECT
  COUNT(*) AS Qtd_Vendas,
  strftime('%Y', v.data_venda) as Ano
FROM
  vendas as v
WHERE
  strftime('%m', v.data_venda) = '11'
and
  Ano = '2022'
GROUP by Ano;

-- Quantidade de vendas atual
SELECT
  Qtd_Vendas as Qtd_Atual
FROM(
  SELECT
    COUNT(*) AS Qtd_Vendas,
    strftime('%Y', v.data_venda) as Ano
  FROM
    vendas as v
  WHERE
    strftime('%m', v.data_venda) = '11'
  and
    Ano = '2022'
  GROUP by Ano
);


WITH
  Media_Vendas_Anteriores AS (
    SELECT
      AVG(Qtd_Vendas) AS Media_Qtd_Vendas
    FROM (
      SELECT
        COUNT(*) AS Qtd_Vendas,
        strftime('%Y', v.data_venda) AS Ano
      FROM
        vendas AS v
      WHERE
        strftime('%m', v.data_venda) = '11'
      GROUP BY
        strftime('%Y', v.data_venda)
      HAVING
        strftime('%Y', v.data_venda) != '2022'
    )
  ),
  Vendas_Atual AS (
    SELECT
      COUNT(*) AS Qtd_Vendas_Atual
    FROM
      vendas AS v
    WHERE
      strftime('%m', v.data_venda) = '11'
      AND strftime('%Y', v.data_venda) = '2022'
  )
SELECT
  mva.Media_Qtd_Vendas,
  va.Qtd_Vendas_Atual,
  ROUND((va.Qtd_Vendas_Atual - mva.Media_Qtd_Vendas) / mva.Media_Qtd_Vendas * 100.0, 2) || '%' AS Porcentagem
FROM
  Vendas_Atual AS va,
  Media_Vendas_Anteriores AS mva;
