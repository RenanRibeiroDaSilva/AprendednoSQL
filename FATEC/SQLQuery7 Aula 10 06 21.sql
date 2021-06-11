--FATEC/Itu 
--Aula Banco de Dados 10/06/2021

/*
21) Usando o LIKE e o NOT LIKE. 
a) Obter o nome dos minerais que se iniciam com a letra P.
b1)Obter o nome dos pa�ses que n�o possuem a letra a no seu nome.
c)Obter o nome dos pa�ses que possuem exatamente 5 letras no seu nome.
*/

--No SQL server, ultiliza-se os seguintes caracteres:
 % -- N�mero qualquer de caracteres, inclusive o 0;
 _ -- Representa um �nico caracter.

 -- a) 
 SELECT nome
 FROM Mineral
 WHERE nome LIKE 'P%'

 -- b1) 
 SELECT nome
 FROM Pais
 WHERE nome LIKE '%a%'

 -- b2)
 SELECT nome
 FROM Pais
 WHERE nome NOT LIKE '%a%'

 -- c)
 SELECT nome
 FROM Pais
 WHERE nome LIKE '_____'


 /*
 22) Extra��o de dados envolvendo valores NULL. 
 a) Ap�s executar a seguinte inser��o:
	insert into Mineral(Nome) values('Mangan�s')
	obetenha uma listagem dos minerais cujo valor � NULL
*/

--a)
insert into Mineral(nome) values('Mangan�s')

SELECT *
FROM Mineral
WHERE preco IS NULL

/*
23) Subconsulta usanso IN e NOT IN. 
a) Obter os nomes dos minerais e seus valores apenas para aqueles que constam serem produzidos por algum pa�s:
b) Obter os nomes dos minerais e seus valores apenas para aqueles que n�o constam serem produzidos por algum pa�s:
*/

--a)
SELECT nome, preco
FROM Mineral
WHERE nome IN 
(SELECT DISTINCT NomeMineral
 FROM PaisMineral)

--b)
SELECT nome, preco
FROM Mineral
WHERE nome NOT IN 
(SELECT DISTINCT NomeMineral
 FROM PaisMineral)

/*
24) Subconsultas com outros operadores de compara��o al�m do IN.
a) Obter on nomes dos minerais e seus valores apenas para aqueles que possuem um valor superior ao do Ouro:
*/

-- a)
SELECT nome, preco
FROM Mineral
WHERE preco > 
(SELECT preco
 FROM Mineral              -----> 43.600
 WHERE nome = 'Ouro')

 /*
 25) Subconsulta usando SOME ou ANY.
 a) Obter os nomes dos minerais apenas para aqueles que possuem uma reserva maior ou igual ao de algum dos minerais produziso
	no Chile(e depois Peru):
*/

--a1)
SELECT nomeMineral
FROM PaisMineral
WHERE reserva >=
(SELECT reserva
 FROM PaisMineral           -----> 2.800.000
 WHERE nomePais = 'Chile')

--a2) dando erro
SELECT nomeMineral
FROM PaisMineral
WHERE reserva >=
(SELECT reserva
 FROM PaisMineral           -----> Dar� erro uma vez que o Peru devolve tr�s valores para compara��o
 WHERE nomePais = 'Peru')

--a2) Correto com uso de SOME ou ALL
SELECT nomeMineral
FROM PaisMineral
WHERE reserva >= SOME
(SELECT reserva
 FROM PaisMineral           -----> Retornara todos os valores que forem maiores ou iguais aos valores dados pelo Peru
 WHERE nomePais = 'Peru')       -- por conta do SOME (algum)

/*
 ______________________________________
 |> SOME ou ANY = Maior do que o menor|
 |< SOME ou ANY = Menor do que o maior|
 |____________________________________|
*/

/*
26) Subconsultas usando ALL. 
a) Obter os nomes dos minerais apenas para aqueles que possuem uma reserva superio ao de todos os minerais produzido nos 
Estado Unidos
*/

--a)
SELECT nomeMineral
FROM PaisMineral
WHERE reserva > ALL
(SELECT reserva
 FROM PaisMineral           -----> Retornar� todos os valores que s�o maiores do que os valores dados pelo Estados Unidos
 WHERE nomePais = 'Estados Unidos')
  
/*
  ____________________________
 |> All = Maior do que o maior|
 |< ALL = Menor do que o menor|
 |____________________________|
*/

/*
27) Subconsultas com m�ltiplos n�veis de aninhamento.
a) Obter os nomes dos pa�ses e seus pibs apenas para aqueles que possuem pib maior do que algum dentre os pa�ses que produzem
Ouro:
*/

--a)
SELECT nome, PIB
FROM Pais
WHERE PIB > SOME
(SELECT PIB
 FROM Pais             --------> Aninhamento de buscas
 WHERE nome IN
 (SELECT NomePais
  FROM PaisMineral
  WHERE nomeMineral = 'Ouro'))

/*
28) Subconsultas usando EXISTS e NOT EXISTS.
a) Obter os nomes dos minerais e seus valores apenas para aqueles que constam ser produzidos por algum pa�s:
b) Obter os nomes dos minerais e seus valores apenas para aqueles que n�o contam serem produzidos por algum pa�s:
*/

--a)
SELECT nome, preco
FROM Mineral
WHERE EXISTS 
(SELECT *
 FROM PaisMineral
 WHERE PaisMineral.nomeMineral = Mineral.nome)

--b)
SELECT nome, preco
FROM Mineral
WHERE NOT EXISTS 
(SELECT *
 FROM PaisMineral
 WHERE PaisMineral.nomeMineral = Mineral.nome)

/*
29) Subconsultas com UNION.
a) Obter uma listagem dos mnerais que s�o prosuzidos pelos Estados Unidos ou pelo Brasil:
*/

--a1) Usando o OR:
SELECT DISTINCT nomeMineral
FROM PaisMineral
WHERE nomePais = 'Estados Unidos' OR nomePais = 'Brasil'

--a2) Usando o UNION
SELECT nomeMineral
FROM PaisMineral
WHERE nomePais = 'Estados Unidos' 
UNION 
SELECT nomeMineral
FROM PaisMineral
WHERE nomePais = 'Brasil'

-- INTERSECT
SELECT nomeMineral
FROM PaisMineral
WHERE nomePais = 'Estados Unidos' 
INTERSECT
SELECT nomeMineral
FROM PaisMineral
WHERE nomePais = 'Brasil'
