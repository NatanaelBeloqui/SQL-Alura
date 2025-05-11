SELECT COUNT(*) as Qtd, 'Categorias' as Tabela FROM categorias

SELECT COUNT(*) as Qtd, 'Clientes' as Tabela FROM clientes

SELECT COUNT(*) as Qtd, 'Fornecedores' as Tabela FROM fornecedores

SELECT COUNT(*) as Qtd, 'ItensVenda' as Tabela FROM itens_venda

SELECT COUNT(*) as Qtd, 'Marcas' as Tabela FROM marcas

SELECT COUNT(*) as Qtd, 'Produtos' as Tabela FROM produtos

SELECT COUNT(*) as Qtd, 'Vendas' as Tabela FROM vendas;

SELECT * FROM vendas LIMIT 5;