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
INNER JOIN	em outra situação
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

--Ligação de três tabelas

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

--Funções de agregação--

--Função |count|. Contar o número de Paises que produzem Ouro

SELECT count(*) AS 'Produtores de Ouro'
FROM PaisMineral
WHERE PaisMineral.nomeMineral = 'Ouro'

--Função |avg (average/media)| Obter a média de PIB dos países cadastrados
SELECT round(avg(PIB), 2) AS 'Média dos PIBs de todos os Países'
FROM Pais

--Funão |max| Obter o maior PIB dos Países cadastrados
SELECT max(PIB) AS 'Maio PIB de todos os Países'
FROM Pais

--Função |min| Obter o menor preço dos minerais cadastrados
SELECT min(preco) AS 'Menor preço de todos os minerais'
FROM Mineral

--Função |sum| Obter a soma dos valores de todos os minerais cadastrados
SELECT round(sum(preco), 2) AS 'Soma dos preços de todos os minerais'
FROM Mineral

/*Cláusula GROUP BY. Obter o nome de todos os países que produzem minerais e a quantidade de minerais que eles
produzem.*/	
SELECT nomePais, count(*) AS 'Número de minerais Prodizidos'
FROM PaisMineral
GROUP BY nomePais

/*Obter o nome de todos os minerais produzidos por algum país e a reserva total destes minerais 
considerando todos os países que os produzem. */
SELECT nomeMineral, sum(reserva) AS 'Reserva total do mineral'
FROM PaisMineral
GROUP BY nomeMineral

/*Cláusula GOUP BY com HAVING. 
	Obter o nome de todos os países que produzem minerais e a quantidade de minerais que ele produzem
apenas para aquele países que produzem mais de um mineral*/
SELECT nomePais, count(*) AS 'Número de minerais Prodizidos'
FROM PaisMineral
GROUP BY nomePais
HAVING count(*) > 1


