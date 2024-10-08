-- comentario -- para iniciar coment�rio --

USE "1701731"  -- QUANDO FOR N�MEROS USAR ASPAS "1701731"

-- criar outro banco
CREATE DATABASE VINI_AULAS

--CRINDO UMA TABELA.
CREATE TABLE TB_TIME(
	CODIGO_TIME	TINYINT,
	NOME_TIME	VARCHAR(50),
	NOME_PRESI	VARCHAR (40),
	CREDITOS	INT

	SELECT * FROM TB_TIME
);

-- n�mericos exatos - decimais --

CREATE TABLE TB_NUMEROS (
	COLUNA1	DECIMAL(5, 2),
	COLUNA2 DECIMAL(9, 7),
	COLUNA3 DECIMAL(2, 1)
);	
	
INSERT INTO TB_NUMEROS VALUES (14.1500, 9.0, 2, 150.509);
ALTER TABLE TB_NUMEROS ADD COLUNA4 NUMERIC (9,5); -- como fazer alter table --
ALTER TABLE TB_NUMEROS ALTER COLUMN COLUNA1 NUMERIC(15,5); -- alterando coluna --
ALTER TABLE TB_NUMEROS ALTER COLUMN COLUNA3 DECIMAL(21,5); -- alterando coluna --
ALTER TABLE TB_NUMEROS ALTER COLUMN COLUNA2 DECIMAL(21,5); -- alterando coluna --

UPDATE TB_NUMEROS SET COLUNA2 = 3.55;
UPDATE TB_NUMEROS SET COLUNA3 = 7.99999;

INSERT INTO TB_NUMEROS VALUES (17599, 17.999, 137.888, 2775.189);
INSERT INTO TB_NUMEROS (COLUNA1, COLUNA2) VALUES (9999.15, 17.355);
	
SELECT * FROM TB_NUMEROS -- visualizar dados --
DROP TABLE TB_NUMEROS -- excluir tabela --

--TESTANDO O FLOAT

CREATE TABLE TABELA1(
	COLUNA1 FLOAT(10),
	COLUNA2 REAL  -- REAL � A MESMA COISA QUE FLOAT 24 --
);

INSERT INTO TABELA1 VALUES (25.232, 123.123), (25.2, 123.112345678), (38, 19.1253);
SELECT * FROM TABELA1

-- trabalhando com data --
CREATE TABLE TB_DATAS (
	DATA1	DATETIME,
	DATA2	SMALLDATETIME,
	DATA3	DATE
);

INSERT INTO TB_DATAS VALUES ('2021-03-21 15:24:30', '2021-03-22 08:00','20210405');
SELECT * FROM TB_DATAS

-- TRABALHANDO COM STRINGS --

CREATE TABLE TB_STRINGS (
	TEXTO1	CHAR(25),		--NCHAR USADO PARA ARMAZENAR CARACTERES ESPECIAIS--
	TEXTO2	VARCHAR(15),	--NVARCHAR USADO PARA ARMAZENAR CARACTERES ESPECIAIS-- POREM OCUPA 2 BYTES --DOBRO DO NORMAL QUE � 1 BYTE
	TEXTO3	VARCHAR(50)		--NVARCHAR (MAX) USADO PARA ARMAZENAR CARACTERES ESPECIAIS--
);

INSERT INTO TB_STRINGS VALUES ('Acre', 'Estado de SP', 'Republica federativa do Brasil');

SELECT * FROM TB_STRINGS;

ALTER TABLE TB_DATAS ADD DATA_ANIVER SMALLDATETIME;

ALTER TABLE TB_DATAS ADD DATA_ANIVER1 SMALLDATETIME;

-- USANDO IDENTITY E NOT NULL --

CREATE TABLE TB_JOGADOR(
	COD_JOGADOR INT IDENTITY (1,1),
	NOME_JOG VARCHAR(30) NOT NULL,
	EMAIL_JOG VARCHAR(50) NOT NULL,
	DATA_JOG SMALLDATETIME
);

SELECT * FROM TB_JOGADOR
INSERT INTO TB_JOGADOR VALUES (1,'VINICIUS REIS','VIH-REIS@HOTMAIL.COM'); -- N�O PODE INSERIR VALOR PARA IDENTITY
INSERT INTO TB_JOGADOR VALUES ('VINICIUS REIS','VIH-REIS@HOTMAIL.COM', '2020-09-21');
INSERT INTO TB_JOGADOR (NOME_JOG, EMAIL_JOG) VALUES ('VINICIUS DOS REIS OLIVERA','VIH-REIS@HOTMAIL.COM');
INSERT INTO TB_JOGADOR (NOME_JOG, EMAIL_JOG) VALUES ('VNNSTAR','VNNSTAR@HOTMAIL.COM');
DROP TABLE TB_JOGADOR

CREATE TABLE TB_JOGADOR1(
	COD_JOGADOR INT IDENTITY (0,1),
	NOME_JOG VARCHAR(30) NOT NULL,
	EMAIL_JOG VARCHAR(50) NOT NULL,
	DATA_JOG SMALLDATETIME
);

INSERT INTO TB_JOGADOR1 VALUES (1,'VINICIUS REIS','VIH-REIS@HOTMAIL.COM'); -- N�O PODE INSERIR VALOR PARA IDENTITY
INSERT INTO TB_JOGADOR1 VALUES ('VINICIUS REIS','VIH-REIS@HOTMAIL.COM', '2020-09-21');
INSERT INTO TB_JOGADOR1 (NOME_JOG, EMAIL_JOG) VALUES ('VINICIUS DOS REIS OLIVERA','VIH-REIS@HOTMAIL.COM');

SELECT * FROM TB_JOGADOR1

-- USANDO PRIMARY KEY, UNIQUE, IDENTITY, FOREIGN KEY --

CREATE TABLE TB_ESTADOS (
	ID_ESTADO SMALLINT IDENTITY,
	SIGLA_ESTADO CHAR(2) NOT NULL,
	VL_ICMS DECIMAL(5,2) NOT NULL DEFAULT 0,
	DT_CADASTRO SMALLDATETIME NOT NULL DEFAULT GETDATE(),

	CONSTRAINT PK_ESTADO	PRIMARY KEY	(ID_ESTADO),
	CONSTRAINT CK_ICMS	CHECK (VL_ICMS >= 0),
	CONSTRAINT UQ_SIGLA	UNIQUE (SIGLA_ESTADO)

);

SELECT * FROM TB_ESTADOS
DROP TABLE TB_ESTADOS
ALTER TABLE TB_ESTADOS ALTER COLUMN ID_ESTADO TINYINT

INSERT INTO TB_ESTADOS VALUES ('RS', 5, '2021-12-21');
INSERT INTO TB_ESTADOS (SIGLA_ESTADO) VALUES ('SP');
INSERT INTO TB_ESTADOS VALUES ('RS', 5, '2021-05-29'); -- ERRO PQ TENTOU REPETIR A CHAVE UNICA (UNIQUE) --

CREATE TABLE TB_CIDADE(
	ID_CIDADE TINYINT IDENTITY,
	NM_CIDADE VARCHAR(30) NOT NULL,
	ID_ESTADO SMALLINT,

	CONSTRAINT PK_CIDADE PRIMARY KEY (ID_CIDADE),
	CONSTRAINT FK_CIDADE_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES TB_ESTADOS (ID_ESTADO)
	
);

SELECT * FROM TB_CIDADE

INSERT INTO TB_CIDADE VALUES ('S�O PAULO', 2)
INSERT INTO TB_CIDADE VALUES ('GUARULHOS', 2)
INSERT INTO TB_CIDADE VALUES ('MOGI DAS CRUZES', 2)
INSERT INTO TB_CIDADE VALUES ('SUZANO', 2)