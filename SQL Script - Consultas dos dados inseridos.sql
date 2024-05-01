-- A. Dados completos de pessoas f�sicas
SELECT Pessoas.*, Pessoas_Fisicas.cpf
FROM Pessoas
INNER JOIN Pessoas_Fisicas ON Pessoas.id_pessoa = Pessoas_Fisicas.id_pessoa

-- B. Dados completos de pesssoas jur�dicas
SELECT Pessoas.*, Pessoas_Juridicas.cnpj
FROM Pessoas
INNER JOIN Pessoas_Juridicas ON Pessoas.id_pessoa = Pessoas_Juridicas.id_pessoa

-- C. Movimenta��es de entrada
SELECT Movimentos.*, Pessoas.nome, Produtos.nome_produto, Movimentos.quantidade, Movimentos.valor_unidade, (Movimentos.valor_unidade * Movimentos.quantidade) AS 'Valor Total'
FROM Movimentos
INNER JOIN Pessoas ON Movimentos.id_pessoa = Pessoas.id_pessoa 
INNER JOIN Produtos ON Movimentos.id_produto = Produtos.id_produto
WHERE Movimentos.tipo = 'E'

-- D. Movimenta��es de sa�da
SELECT Movimentos.*, Pessoas.nome, Produtos.nome_produto, Movimentos.quantidade, Movimentos.valor_unidade, (Movimentos.valor_unidade * Movimentos.quantidade) AS 'Valor Total'
FROM Movimentos
INNER JOIN Pessoas ON Movimentos.id_pessoa = Pessoas.id_pessoa 
INNER JOIN Produtos ON Movimentos.id_produto = Produtos.id_produto
WHERE Movimentos.tipo = 'S'

-- E. Valor total das entradas agrupadas por produto
SELECT Produtos.nome_produto, SUM(Movimentos.valor_unidade * Movimentos.quantidade) AS valor_total
FROM Movimentos
INNER JOIN Produtos ON Movimentos.id_produto = Produtos.id_produto
WHERE Movimentos.tipo = 'E'
GROUP BY Produtos.nome_produto

-- F. Valor total das sa�das agrupadas por produto
SELECT Produtos.nome_produto, SUM(Movimentos.valor_unidade * Movimentos.quantidade) AS valor_total
FROM Movimentos
INNER JOIN Produtos ON Movimentos.id_produto = Produtos.id_produto
WHERE Movimentos.tipo = 'S'
GROUP BY Produtos.nome_produto

-- G. Operadores (usu�rios) que n�o efetuaram compra
SELECT Usuarios.login_usuario
FROM Usuarios
LEFT JOIN Movimentos ON Usuarios.id_usuario = Movimentos.id_usuario
WHERE Movimentos.id_movimento IS NULL

-- H. Valor total de entrada, agrupado por operadores
SELECT Movimentos.id_usuario, SUM(Movimentos.valor_unidade * Movimentos.quantidade) AS valor_total
FROM Movimentos
INNER JOIN Produtos ON Movimentos.id_produto = Produtos.id_produto
WHERE Movimentos.tipo = 'E'
GROUP BY Movimentos.id_usuario

-- I. Valor total de sa�da, agrupado por operadores
SELECT Movimentos.id_usuario, SUM(Movimentos.valor_unidade * Movimentos.quantidade) AS valor_total
FROM Movimentos
INNER JOIN Produtos ON Movimentos.id_produto = Produtos.id_produto
WHERE Movimentos.tipo = 'S'
GROUP BY Movimentos.id_usuario

-- J. Valor m�dio de venda por produto
SELECT Produtos.nome_produto AS 'Nome do Produto', SUM(Movimentos.valor_unidade * Movimentos.quantidade)/SUM(Movimentos.quantidade) AS 'M�dia Poderada'
FROM Movimentos
INNER JOIN Produtos ON Movimentos.id_produto = Produtos.id_produto
GROUP BY Produtos.nome_produto