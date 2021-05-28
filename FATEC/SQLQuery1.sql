create table Mineral
(
	nome varchar(15)primary key, 
	preco real
)

create table Pais
(
	nome varchar(30)primary key,
	PIB real
)

create table PaisMineral
(
	nomePais varchar(30)not null,
	nomeMineral varchar(15)not null,
	reserva real,
	producao real,
	primary key(nomePais, nomeMineral),
	foreign key(nomePais) references Pais(nome),
	foreign key(nomeMineral) references Mineral(nome)
)

insert into Pais values('Brasil',756.2)
insert into Pais values('Argentina',377.5)
insert into Pais values('Chile',223.7)
insert into Pais values('Peru',232.4)
insert into Pais values('Bolívia',223.7)
insert into Pais values('México',613.6)
insert into Pais values('Estados Unidos',14300)

insert into Mineral values('Ouro',43600)
insert into Mineral values('Prata',500)
insert into Mineral values('Bronze',250.35)
insert into Mineral values('Paladio',24200)
insert into Mineral values('Platina',86500)
insert into Mineral values('Cobre',12.5)
insert into Mineral values('Estanho',31.53)

insert into PaisMineral values('Estados Unidos','Ouro',1000000,240)
insert into PaisMineral values('Peru','Ouro',500000,170)
insert into PaisMineral values('Argentina','Ouro',30000,40)
insert into PaisMineral values('Brasil','Ouro',20000,37)
insert into PaisMineral values('México','Prata',2800000,2748)
insert into PaisMineral values('Peru','Prata',2000000,2200)
insert into PaisMineral values('Argentina','Prata',450000,300)
insert into PaisMineral values('Estados Unidos','Platina',1200,4.39)
insert into PaisMineral values('Estados Unidos','Paladio',2300,12.26)
insert into PaisMineral values('Chile','Cobre',2800000,5360.8)
insert into PaisMineral values('Peru','Cobre',750000,980.6)
insert into PaisMineral values('Brasil','Estanho',42300,15)
insert into PaisMineral values('Argentina','Estanho',5200,5)