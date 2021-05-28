/*
SELECT Nome
FROM Pais
WHERE Pib > 300
*/

/*
SELECT Pib
FROM Pais
*/

/*
SELECT DISTINCT Pib
FROM Pais
*/

/*              
SELECT Nome, round(Pib*5.28, 2) AS 'Pib em bilhoes de reais'
FROM Pais
*/

/*
SELECT *
FROM PaisMineral
*/

/*
SELECT *
FROM PaisMineral
WHERE Reserva > 400000 AND Producao > 200
*/

/*
SELECT *
FROM PaisMineral
WHERE Reserva >= 500000 AND Reserva <= 2000000
*/

/*
SELECT *
FROM PaisMineral
WHERE Reserva BETWEEN 500000 AND 2000000
*/

/*
SELECT *
FROM PaisMineral
WHERE NomePais = 'Brasil' OR  NomePais = 'Argentina' OR  NomePais = 'Chile'
*/

/*
SELECT *
FROM PaisMineral
WHERE NomePais IN ('Argentina','Brasil','Chile')
*/

/*
SELECT *
FROM PaisMineral
ORDER BY NomeMineral ASC
*/

/*
SELECT *
FROM PaisMineral
ORDER BY NomePais DESC
*/

/*
SELECT *
FROM PaisMineral
ORDER BY NomePais DESC, NomeMineral ASC
*/

--------------------------------------------------
/* Junção (JOIN) - HÁ 4 TIPOS QUE SÃO

INNER JOIN (junção interna) - Há 2 sintaxes.
RIGHT JOIN (junção à direita) 
LEFT JOIN (junção à esquerda)
FULL OUTER JOIN (junção externa)
*/

--Sintaxe 1:
/*
SELECT PaisMineral.NomePais, PaisMineral.NomeMineral, Mineral.Preco
FROM PaisMineral, Mineral
WHERE PaisMineral.NomeMineral = Mineral.Nome

--Condição de Junção ^^
*/


