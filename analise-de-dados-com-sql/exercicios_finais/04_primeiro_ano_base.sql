SELECT
  MIN(strftime('%Y', data_venda)) as Primeiro_Ano_Base
from
  vendas;
  