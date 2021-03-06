CREATE DATABASE FeelItaly;
GO

USE FeelItaly;
GO

CREATE TABLE Utilizador(
    Username NVARCHAR(32) NOT NULL PRIMARY KEY,
    Passwd  NVARCHAR(16) NOT NULL,
    Email NVARCHAR(225) NOT NULL,
    Nome NVARCHAR(225) NOT NULL
);

CREATE TABLE Categoria(
    IdCategoria INT NOT NULL PRIMARY KEY,
    Descricao NVARCHAR(32) NOT NULL
);

CREATE TABLE Receita(
    IdReceita INT NOT NULL PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Nutricional FLOAT NOT NULL,
    TempoTotal INT NOT NULL,
    Avaliacao FLOAT NOT NULL
);

CREATE TABLE CategoriaReceita(
	Id INT NOT NULL PRIMARY KEY,
    IdCategoria INT NOT NULL,
    IdReceita INT NOT NULL
);

CREATE TABLE ConfiguracaoInicial(
	IdReceita INT NOT NULL PRIMARY KEY,
	Username NVARCHAR(32) NOT NULL
);

CREATE TABLE Passo(
	IdPasso INT NOT NULL PRIMARY KEY,
	TempoParcial FLOAT NOT NULL,
	Unidade NVARCHAR(32),
	Quantidade NVARCHAR(10) NOT NULL,
	Extra NVARCHAR(255),
	IdReceita INT,
	IdIngrediente INT,
	IdAcao INT
);

CREATE TABLE Historico(
	IdHistorico INT PRIMARY KEY,
	IdReceita INT NOT NULL,
	Username NVARCHAR(32) NOT NULL,
	IdPasso INT NOT NULL,
	TempoPasso FLOAT NOT NULL,
	Dataa DATETIME NOT NULL,
	NrPasso INT NOT NULL
);

CREATE TABLE Ingrediente(
	IdIngrediente INT NOT NULL PRIMARY KEY,
	Nome NVARCHAR(100) NOT NULL
);

CREATE TABLE Acao(
	IdAcao INT NOT NULL PRIMARY KEY,
	Descricao NVARCHAR(32) NOT NULL
);

CREATE TABLE ReceitaPasso(
	Id INT NOT NULL PRIMARY KEY,
	IdReceita INT NOT NULL,
	IdPasso INT NOT NULL,
	Numero INT NOT NULL
);

CREATE TABLE Tutorial(
	IdPasso INT NOT NULL PRIMARY KEY,
	Link NVARCHAR(255) NOT NULL
);

CREATE TABLE Utensilio(
	IdUtensilio INT NOT NULL PRIMARY KEY,
	Descricao NVARCHAR(32) NOT NULL
);

CREATE TABLE UtensilioPasso(
	Id INT NOT NULL PRIMARY KEY,
	IdUtensilio INT NOT NULL,
	IdPasso INT NOT NULL
);

CREATE TABLE Comentario(
	IdComentario INT NOT NULL PRIMARY KEY,
	Descricao NVARCHAR(100) NOT NULL,
	Dataa DATETIME NOT NULL,
	IdReceita INT NOT NULL
);

-- Utilizadores
-- Username NVARCHAR(32), Passwd  NVARCHAR(16), Email NVARCHAR(225), Nome NVARCHAR(225)

INSERT INTO Utilizador
VALUES('diogofbraga','dfb','diogofiliperfbraga@gmail.com','Diogo Braga')

INSERT INTO Utilizador
VALUES('ricardomilhazes','rm10','rmilhazesveloso@gmail.com','Ricardo Milhazes')

INSERT INTO Utilizador
VALUES('joaopedro','joaop21','jpsilva9898@gmail.com','João Silva')

INSERT INTO Utilizador
VALUES('ricardofsc10','rc10','ricardofsc10@gmail.com','Ricardo Caçador')

INSERT INTO Utilizador
VALUES('rjsf','rj','rjsf@gmail.com','Ricardo Ferreira')


-- Categorias
-- IdCategoria INT, Descricao NVARCHAR(32)

INSERT INTO Categoria
VALUES(1,'Massas')

INSERT INTO Categoria
VALUES(2,'Pizzas')

INSERT INTO Categoria
VALUES(3,'Tartes')

INSERT INTO Categoria
VALUES(4,'Carne')

INSERT INTO Categoria
VALUES(5,'Peixe')

INSERT INTO Categoria
VALUES(6,'Entradas')

INSERT INTO Categoria
VALUES(7,'Sobremesa')

INSERT INTO Categoria
VALUES(8,'Vegetariano')


-- Receitas
-- IdReceita INT, Nome NVARCHAR(100), Nutricional FLOAT, TempoTotal INT, Avaliacao FLOAT

INSERT INTO Receita
VALUES(1,'Carbonara',655.0,25,4.3)

INSERT INTO Receita
VALUES(2,'Molho de Tomate',80.0,50,3.5)

INSERT INTO Receita
VALUES(3,'Pizza Marguerita',204.0,90,4.7)

INSERT INTO Receita
VALUES(4,'Lasanha de Legumes',500.0,45,4.2)

INSERT INTO Receita
VALUES(5,'Tagliatelle Com Cogumelos',700.0,50,3.7)

INSERT INTO Receita
VALUES(6,'Raviolis de Espargos',600.0,50,2.6)

-- CategoriasReceitas
-- Id INT, IdCategoria INT, IdReceita INT

INSERT INTO CategoriaReceita
VALUES(1,1,1)

INSERT INTO CategoriaReceita
VALUES(2,2,2)

INSERT INTO CategoriaReceita
VALUES(3,2,3)

INSERT INTO CategoriaReceita
VALUES(4,8,4)

INSERT INTO CategoriaReceita
VALUES(5,1,5)

INSERT INTO CategoriaReceita
VALUES(6,1,6)

-- ConfiguraçõesIniciais
-- IdReceita INT, Username NVARCHAR(32)

INSERT INTO ConfiguracaoInicial
VALUES(1,'diogofbraga')

INSERT INTO ConfiguracaoInicial
VALUES(2,'ricardofsc10')


-- Passos
-- IdPasso INT, TempoParcial FLOAT, Unidade NVARCHAR(32), Quantidade NVARCHAR(32),
-- Extra NVARCHAR(255), IdReceita(SubReceita) INT, IdIngrediente INT, IdAcao INT

INSERT INTO Passo VALUES(1,30.0,'colheres de sopa','2','numa frigideira',-1,1,1)

INSERT INTO Passo VALUES(2,300.0,'gramas','200','na frigideira',-1,2,2)

INSERT INTO Passo VALUES(3,120.0,'','2','',-1,3,3)

INSERT INTO Passo VALUES(4,30.0,'mililitros','80','',-1,4,4)

INSERT INTO Passo VALUES(5,10.0,'colheres de chá','1','',-1,5,5)

INSERT INTO Passo VALUES(6,60.0,'','','e as natas ao bacon', -1,3,6)

INSERT INTO Passo VALUES(7,180.0,'','','tudo durante 3 minutos em lume brando',-1,'',7)

INSERT INTO Passo VALUES(8,30.0,'gramas','300','num tacho',-1,6,1)

INSERT INTO Passo VALUES(9,10.0,'pitada','1','ao tacho',-1,5,4)

INSERT INTO Passo VALUES(10,480.0,'','','durante 8 minutos',-1,6,8)

INSERT INTO Passo VALUES(11,30.0,'','','para a frigideira',-1,6,9)

INSERT INTO Passo VALUES(12,30.0,'gramas','50','',-1,7,1)

INSERT INTO Passo VALUES(13,10.0,'','','a gosto',-1,8,1)

INSERT INTO Passo VALUES(14,30.0,'','1','',-1,9,10)

INSERT INTO Passo VALUES(15,30.0,'','1','',-1,10,10)

INSERT INTO Passo VALUES(16,120.0,'','1','',-1,10,16)

INSERT INTO Passo VALUES(17,180.0,'','1','',-1,9,16)

INSERT INTO Passo VALUES(18,180.0,'','','no azeite',-1,'',11)

INSERT INTO Passo VALUES(19,300.0,'gramas','400','em pedaços pequenos',-1,16,6)

INSERT INTO Passo VALUES(20,900.0,'','','em lume brando durante 15 minutos, sem tapar',-1,'',12)

INSERT INTO Passo VALUES(21,600.0,'','','com açúcar, sal, louro e pimenta e deixar cozer durante mais 10 minutos',-1,'',5)

INSERT INTO Passo VALUES(22,10.0,'','','as ervas aromáticas',-1,'',6)

INSERT INTO Passo VALUES(23,600.0,'','','durante 10 minutos',-1,'',8)

INSERT INTO Passo VALUES(24,10.0,'colheres de chá','2 a 3','',-1,15,13)

INSERT INTO Passo VALUES(25,10.0,'','','',-1,13,14)

INSERT INTO Passo VALUES(26,120.0,'','','varinha mágica',-1,'',15)


INSERT INTO Passo VALUES(27,3000.0,'','','',2,17,25)
INSERT INTO Passo VALUES(28,120.0,'','2', 'em rodelas de 1/2 cm de espessura',-1,19,18)
INSERT INTO Passo VALUES(29,120.0,'','','na parte grossa do ralador',-1,18,19)
INSERT INTO Passo VALUES(30,30.0,'','','que será utilizado',-1,12,20)
INSERT INTO Passo VALUES(31,60.0,'colheres de sopa','4', 'sobre a base da pizza',-1,17,21)
INSERT INTO Passo VALUES(32,30.0,'','','ralada por cima do molho de tomate',-1,18,22)
INSERT INTO Passo VALUES(33,60.0,'','','por cima da mozzarela',-1,19,21)
INSERT INTO Passo VALUES(34,60.0,'colheres de sopa','2 a 3','',-1,1,23)
INSERT INTO Passo VALUES(35,1800.0,'','','ao forno cerca de 30 minutos, até a mozzarela derreter',-1,'',24)
INSERT INTO Passo VALUES(36,60.0,'','','a pizza do forno e salpicar com algumas folhas de manjericão por cima',-1,'',14)
INSERT INTO Passo VALUES(37,30.0,'','','bem quente',-1,'',26)



-- Ingredientes
-- IdIngrediente INT, Nome NVARCHAR(100)

INSERT INTO Ingrediente VALUES(1,'azeite')

INSERT INTO Ingrediente VALUES(2,'bacon')

INSERT INTO Ingrediente VALUES(3,'ovos')

INSERT INTO Ingrediente VALUES(4,'natas')

INSERT INTO Ingrediente VALUES(5,'sal')

INSERT INTO Ingrediente VALUES(6,'esparguete')

INSERT INTO Ingrediente VALUES(7,'queijo parmesão ralado')

INSERT INTO Ingrediente VALUES(8,'pimenta preta')

INSERT INTO Ingrediente VALUES(9,'cebola')

INSERT INTO Ingrediente VALUES(10,'dente de alho')

INSERT INTO Ingrediente VALUES(11,'açúcar')

INSERT INTO Ingrediente VALUES(12,'manjericão')

INSERT INTO Ingrediente VALUES(13,'folha de louro')

INSERT INTO Ingrediente VALUES(14,'orégãos')

INSERT INTO Ingrediente VALUES(15,'concentrado de tomate')

INSERT INTO Ingrediente VALUES(16,'tomate pelado')

INSERT INTO Ingrediente VALUES(17, 'molho de tomate')

INSERT INTO Ingrediente VALUES(18,'mozzarela')

INSERT INTO Ingrediente VALUES(19,'tomate')

-- Ações
-- IdAcao INT, Descricao NVARCHAR(32)

INSERT INTO Acao VALUES(1,'Colocar')

INSERT INTO Acao VALUES(2,'Fritar')

INSERT INTO Acao VALUES(3,'Bater')

INSERT INTO Acao VALUES(4,'Acrescentar')

INSERT INTO Acao VALUES(5,'Temperar')

INSERT INTO Acao VALUES(6,'Juntar')

INSERT INTO Acao VALUES(7,'Cozinhar')

INSERT INTO Acao VALUES(8,'Cozer')

INSERT INTO Acao VALUES(9,'Escorrer')

INSERT INTO Acao VALUES(10,'Descascar')

INSERT INTO Acao VALUES(11,'Refogar')

INSERT INTO Acao VALUES(12,'Ferver')

INSERT INTO Acao VALUES(13,'Misturar')

INSERT INTO Acao VALUES(14,'Retirar')

INSERT INTO Acao VALUES(15,'Passar')

INSERT INTO Acao VALUES(16,'Picar')

INSERT INTO Acao VALUES(17,'Pré-aquecer')

INSERT INTO Acao VALUES(18,'Cortar')

INSERT INTO Acao VALUES(19,'Ralar')

INSERT INTO Acao VALUES(20,'Separar')

INSERT INTO Acao VALUES(21,'Espalhar')

INSERT INTO Acao VALUES(22,'Adicionar')

INSERT INTO Acao VALUES(23,'Regar')

INSERT INTO Acao VALUES(24,'Levar')

INSERT INTO Acao VALUES(25,'Preparar')

INSERT INTO Acao VALUES(26,'Servir')

-- ReceitasPassos
-- Id INT, IdReceita INT, IdPasso INT, Numero INT

INSERT INTO ReceitaPasso VALUES(1,1,1,1)

INSERT INTO ReceitaPasso VALUES(2,1,2,2)

INSERT INTO ReceitaPasso VALUES(3,1,3,3)

INSERT INTO ReceitaPasso VALUES(4,1,4,4)

INSERT INTO ReceitaPasso VALUES(5,1,5,5)

INSERT INTO ReceitaPasso VALUES(6,1,6,6)

INSERT INTO ReceitaPasso VALUES(7,1,7,7)

INSERT INTO ReceitaPasso VALUES(8,1,8,8)

INSERT INTO ReceitaPasso VALUES(9,1,9,9)

INSERT INTO ReceitaPasso VALUES(10,1,10,10)

INSERT INTO ReceitaPasso VALUES(11,1,11,11)

INSERT INTO ReceitaPasso VALUES(12,1,12,12)

INSERT INTO ReceitaPasso VALUES(13,1,13,13)

INSERT INTO ReceitaPasso VALUES(14,2,14,1)

INSERT INTO ReceitaPasso VALUES(15,2,15,2)

INSERT INTO ReceitaPasso VALUES(16,2,16,3)

INSERT INTO ReceitaPasso VALUES(17,2,17,4)

INSERT INTO ReceitaPasso VALUES(18,2,18,5)

INSERT INTO ReceitaPasso VALUES(19,2,19,6)

INSERT INTO ReceitaPasso VALUES(20,2,20,7)

INSERT INTO ReceitaPasso VALUES(21,2,21,8)

INSERT INTO ReceitaPasso VALUES(22,2,22,9)

INSERT INTO ReceitaPasso VALUES(23,2,23,10)

INSERT INTO ReceitaPasso VALUES(24,2,24,11)

INSERT INTO ReceitaPasso VALUES(25,2,25,12)

INSERT INTO ReceitaPasso VALUES(26,2,26,13)

INSERT INTO ReceitaPasso VALUES(27,3,27,1)
INSERT INTO ReceitaPasso VALUES(28,3,28,2)
INSERT INTO ReceitaPasso VALUES(29,3,29,3)
INSERT INTO ReceitaPasso VALUES(30,3,30,4)
INSERT INTO ReceitaPasso VALUES(31,3,31,5)
INSERT INTO ReceitaPasso VALUES(32,3,32,6)
INSERT INTO ReceitaPasso VALUES(33,3,33,7)
INSERT INTO ReceitaPasso VALUES(34,3,34,8)
INSERT INTO ReceitaPasso VALUES(35,3,35,9)
INSERT INTO ReceitaPasso VALUES(36,3,36,10)
INSERT INTO ReceitaPasso VALUES(37,3,37,11)



-- Históricos

INSERT INTO Historico
VALUES(1,1,'diogofbraga',1,45.0,'2018-05-04 00:35:00',3)


-- Tutoriais
-- IdPasso INT, Link NVARCHAR(255)

INSERT INTO Tutorial
VALUES(2,'https://www.youtube.com/embed/T8zjP6GgNPs')

INSERT INTO Tutorial
VALUES(10,'https://www.youtube.com/embed/LrnbH17E308')

INSERT INTO Tutorial
VALUES(14,'https://www.youtube.com/embed/EO3hfPYqLaI')

INSERT INTO Tutorial
VALUES(15,'https://www.youtube.com/embed/AN1L3yIHSos')

INSERT INTO Tutorial
VALUES(16,'https://www.youtube.com/embed/WaRd0YG6WPM')

INSERT INTO Tutorial
VALUES(17,'https://www.youtube.com/embed/s49BMDPb-u4')


-- Utensílios
-- IdUtensilio INT, Descricao NVARCHAR(32)

INSERT INTO Utensilio
VALUES(1,'frigideira')

INSERT INTO Utensilio
VALUES(2,'tigela')

INSERT INTO Utensilio
VALUES(3,'batedor')

INSERT INTO Utensilio
VALUES(4,'colher de sopa')

INSERT INTO Utensilio
VALUES(5,'tacho')

INSERT INTO Utensilio
VALUES(6,'colher')

INSERT INTO Utensilio
VALUES(7,'varinha mágica')

INSERT INTO Utensilio
VALUES(8,'forno')

INSERT INTO Utensilio
VALUES(9,'tacho')

INSERT INTO Utensilio
VALUES(10,'ralador')



-- UtensíliosPassos
-- Id INT, IdUtensilio INT, IdPasso INT

INSERT INTO UtensilioPasso
VALUES(1,1,1)

INSERT INTO UtensilioPasso
VALUES(2,1,2)

INSERT INTO UtensilioPasso
VALUES(3,2,3)

INSERT INTO UtensilioPasso
VALUES(4,8,35)

INSERT INTO UtensilioPasso
VALUES(5,9,8)

INSERT INTO UtensilioPasso
VALUES(6,9,9)

INSERT INTO UtensilioPasso
VALUES(7,1,11)

INSERT INTO UtensilioPasso
VALUES(8,9,20)

INSERT INTO UtensilioPasso
VALUES(9,7,26)

INSERT INTO UtensilioPasso
VALUES(10,10,29)

-- Comentarios
-- IdComentario INT, Descricao NVARCHAR(100), Dataa DATETIME, IdReceita INT

INSERT INTO Comentario
VALUES(1,'Excelente massa! Aconselho vivamente!','2018-05-04 00:35:00',1)

SELECT * FROM Utilizador

SELECT * FROM Receita

SELECT * FROM Categoria

SELECT * FROM CategoriaReceita

SELECT * FROM ConfiguracaoInicial;

SELECT * FROM Passo;

SELECT * FROM Historico;

SELECT * FROM Ingrediente;

SELECT * FROM Acao;

SELECT * FROM ReceitaPasso;

SELECT * FROM Tutorial;

SELECT * FROM Utensilio;

SELECT * FROM UtensilioPasso;

SELECT * FROM Comentario;
