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
    Avaliacao FLOAT NOT NULL,
);

CREATE TABLE CategoriaReceita(
    IdCategoria INT NOT NULL PRIMARY KEY,
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
	Quantidade INT NOT NULL,
	Extra NVARCHAR(255),
	IdReceita INT,
	IdIngrediente INT NOT NULL,
	IdAcao INT NOT NULL
);

CREATE TABLE Historico(
	IdReceita INT NOT NULL PRIMARY KEY,
	Username NVARCHAR(32) NOT NULL,
	IdPasso INT NOT NULL,
	TempoPasso FLOAT NOT NULL,
	Dataa DATETIME NOT NULL,
	NrPasso INT NOT NULL
);

CREATE TABLE Ingrediente(
	IdIngrediente INT NOT NULL PRIMARY KEY,
	ValorNutricional FLOAT NOT NULL,
	Nome NVARCHAR(100) NOT NULL
);

CREATE TABLE Acao(
	IdAcao INT NOT NULL PRIMARY KEY,
	Descricao NVARCHAR(32) NOT NULL
);

CREATE TABLE ReceitaPasso(
	IdReceita INT NOT NULL PRIMARY KEY,
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
	IdUtensilio INT NOT NULL PRIMARY KEY,
	IdPasso INT NOT NULL
);

CREATE TABLE Comentario(
	IdComentario INT NOT NULL PRIMARY KEY,
	Descricao NVARCHAR(32) NOT NULL,
	Dataa DATETIME NOT NULL,
	IdReceita INT NOT NULL
);

-- Utilizadores

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

-- Receitas

INSERT INTO Receita
VALUES(1,'Tagliatelle',356.0,25,4.3)


-- CategoriasReceitas

INSERT INTO CategoriaReceita
VALUES(1,1)

-- ConfiguraçõesIniciais

INSERT INTO ConfiguracaoInicial
VALUES(1,'diogofbraga')

-- Passos

INSERT INTO Passo
VALUES(1,4.0,'','','com papel de cozinha',1,1,1)

-- Históricos

INSERT INTO Historico
VALUES(1,'diogofbraga',1,45.0,'2018-05-04 00:35:00',3)

-- Ingredientes

INSERT INTO Ingrediente
VALUES(1,200.0,'Cogumelos')

-- Ações

INSERT INTO Acao
VALUES(1,'Limpar')

-- ReceitasPassos

INSERT INTO ReceitaPasso
VALUES(1,1,1)

-- Tutoriais

INSERT INTO Tutorial
VALUES(1,'https://www.youtube.com/watch?v=i7AZjzVx7os')

-- Utensílios

INSERT INTO Utensilio
VALUES(1,'Faca')

-- UtensíliosPassos

INSERT INTO UtensilioPasso
VALUES(1,1)

-- Comentarios

INSERT INTO Comentario
VALUES(1,'Grande pissa','2018-05-04 00:35:00',2)

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
