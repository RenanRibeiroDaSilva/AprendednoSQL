/*
 Aula Banco de dados 27/05/2021

*/

--Sintaxe 2
SELECT PaisMineral.nomePais, PaisMineral.nomeMineral, Mineral.preco
FROM PaisMineral INNER JOIN Mineral
ON PaisMineral.nomeMineral = Mineral.nome

/*
RIGHT JOIN
*/

SELECT PaisMineral.nomePais, Mineral.nome, Mineral.preco
FROM PaisMineral RIGHT JOIN Mineral
ON PaisMineral.nomeMineral = Mineral.nome

/*
LEFT JOIN
*/

SELECT PaisMineral.nomePais, Mineral.nome, Mineral.preco
FROM Mineral LEFT JOIN PaisMineral
ON PaisMineral.nomeMineral = Mineral.nome

/*
INNER JOIN	em outra situa��o
*/

--Sintaxe 1
SELECT PaisMineral.nomePais, Mineral.nome, Mineral.preco
FROM Mineral, PaisMineral
WHERE PaisMineral.nomeMineral = Mineral.nome AND Mineral.preco > 100

--Sintaxe 2
SELECT PaisMineral.nomePais, Mineral.nome, Mineral.preco
FROM Mineral INNER JOIN PaisMineral
ON PaisMineral.nomeMineral = Mineral.nome
WHERE Mineral.preco > 100

--Liga��o de tr�s tabelas

--Sintaxe 1
SELECT Pais.nome, Pais.PIB, Mineral.nome, Mineral.preco
FROM Mineral, PaisMineral, Pais
WHERE PaisMineral.nomeMineral = Mineral.nome AND PaisMineral.nomePais = Pais.nome

--Sintaxe 2 (SQL SERVER)
SELECT Pais.nome, Pais.PIB, Mineral.nome, Mineral.preco
FROM Mineral INNER JOIN PaisMineral
ON PaisMineral.nomeMineral = Mineral.nome
INNER JOIN Pais
ON PaisMineral.nomePais = Pais.nome

--Sintaxe 2 (ACCES E SQL SERVER)
SELECT Pais.nome, Pais.PIB, Mineral.nome, Mineral.preco
FROM Mineral INNER JOIN
(PaisMineral INNER JOIN Pais
ON PaisMineral.nomePais = Pais.nome)
ON PaisMineral.nomeMineral = Mineral.nome;

/*
OUTER JOIN
*/

SELECT Pais.nome, Pais.PIB, Mineral.nome, Mineral.preco
FROM Mineral LEFT JOIN PaisMineral
ON PaisMineral.nomeMineral = Mineral.nome
FULL OUTER JOIN Pais
ON PaisMineral.nomePais = Pais.nome

--Fun��es de agrega��o--

--Fun��o |count|. Contar o n�mero de Paises que produzem Ouro

SELECT count(*) AS 'Produtores de Ouro'
FROM PaisMineral
WHERE PaisMineral.nomeMineral = 'Ouro'

--Fun��o |avg (average/media)| Obter a m�dia de PIB dos pa�ses cadastrados
SELECT round(avg(PIB), 2) AS 'M�dia dos PIBs de todos os Pa�ses'
FROM Pais

--Fun�o |max| Obter o maior PIB dos Pa�ses cadastrados
SELECT max(PIB) AS 'Maio PIB de todos os Pa�ses'
FROM Pais

--Fun��o |min| Obter o menor pre�o dos minerais cadastrados
SELECT min(preco) AS 'Menor pre�o de todos os minerais'
FROM Mineral

--Fun��o |sum| Obter a soma dos valores de todos os minerais cadastrados
SELECT round(sum(preco), 2) AS 'Soma dos pre�os de todos os minerais'
FROM Mineral

/*Cl�usula GROUP BY. Obter o nome de todos os pa�ses que produzem minerais e a quantidade de minerais que eles
produzem.*/	
SELECT nomePais, count(*) AS 'N�mero de minerais Prodizidos'
FROM PaisMineral
GROUP BY nomePais

/*Obter o nome de todos os minerais produzidos por algum pa�s e a reserva total destes minerais 
considerando todos os pa�ses que os produzem. */
SELECT nomeMineral, sum(reserva) AS 'Reserva total do mineral'
FROM PaisMineral
GROUP BY nomeMineral

/*Cl�usula GOUP BY com HAVING. 
	Obter o nome de todos os pa�ses que produzem minerais e a quantidade de minerais que ele produzem
apenas para aquele pa�ses que produzem mais de um mineral*/
SELECT nomePais, count(*) AS 'N�mero de minerais Prodizidos'
FROM PaisMineral
GROUP BY nomePais
HAVING count(*) > 1


