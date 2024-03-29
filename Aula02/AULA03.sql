﻿﻿-- COLOCANDO O BD EM USO
USE SALA_DE_AULA

-- EXCLUINDO UMA TABELA
DROP TABLE IF EXISTS ALUNOS;

-- CRIANDO TABELA ALUNOS
	CREATE TABLE ALUNOS
	(
		NUM_ALUNO INT IDENTITY , 
		NOME VARCHAR(30) NOT NULL,
		DATA_NASCIMENTO DATETIME,
		IDADE TINYINT,
		E_MAIL VARCHAR(50),
		FONE_RES CHAR(8),
		FONE_COM CHAR(8),
		FAX CHAR(8),
		CELULAR CHAR(9),
		PROFISSAO VARCHAR(40),
		EMPRESA VARCHAR(50) 
	);


-- INSERINDO UM ÚNICO REGISTRO
 INSERT INTO ALUNOS
(NOME, 	DATA_NASCIMENTO, 	IDADE, 	E_MAIL, 
FONE_RES, 	FONE_COM, 	FAX, 	CELULAR,
PROFISSAO, 	EMPRESA )
VALUES
('GUSTAVO FERREIRA', 	'1987.04.27', 	33,	 'gustavo@gferreira.com',
'23456789',	'23459876',	'', 	'998765432',
'PROFESSOR', 'IMPACTA TECNOLOGIA');

-- Consultar os dados inseridos na tabela
SELECT * FROM ALUNOS;

-- INSERINDO MAIS DE UM REGISTRO
 INSERT INTO ALUNOS
(NOME, 	DATA_NASCIMENTO)
VALUES
('GUSTAVO', 	'1991-11-20'), 
('MARCOS', 	'1992-03-27'), 
('GABRIELA',	'1994-02-05'), 
('MARIA', 	'1999-08-05');

-- Consultar os dados inseridos na tabela
SELECT * FROM ALUNOS;

--
-- INSERINDO INFORMANDO AS COLUNAS – INSERT DECLARATIVO
 INSERT INTO ALUNOS
(NOME, 	DATA_NASCIMENTO, 	PROFISSAO)
VALUES
('JOÃO', 	'2000-1-1',		'ESTUDANTE')

-- INSERT DECLARATIVO + DE UM REGISTRO
 INSERT INTO ALUNOS
(NOME, 	DATA_NASCIMENTO, 	PROFISSAO)
VALUES
('MARCOS', 	 '1992-03-27',	'GERENTE'), 
('GABRIELA', '1994-02-05',	'ANALISTA')

-- Consultar os dados inseridos na tabela
SELECT * FROM ALUNOS;

--
-- INSERINDO DE ACORDO COM A ESTRUTURA DA TABELA– INSERT POSICIONAL
INSERT INTO ALUNOS
VALUES
('André da Silva', '1980.1.2', 33, 'andre@silva.com',
'23456789','23459876','', '998765432',
'ANALISTA DE SISTEMAS', 'SOMA INFORMÁTICA'),
('Marcelo Soares', '1983.4.21', 30, 'marcelo@soares.com',
'23456789','23459876','', '998765432',
'INSTRUTOR', 'IMPACTA TECNOLOGIA');

-- Consultar os dados inseridos na tabela
SELECT * FROM ALUNOS;

--
-- CRIANDO TABELA 
CREATE TABLE ALUNOS2
( NUM_ALUNO INT,	NOME VARCHAR(30),	DATA_NASCIMENTO DATETIME,	IDADE TINYINT,
E_MAIL VARCHAR(50),	FONE_RES CHAR(8),	FONE_COM CHAR(8),	FAX CHAR(8), CELULAR CHAR(9),
PROFISSAO VARCHAR(40), EMPRESA VARCHAR(50) );

-- INSERINDO COM SELECT
INSERT INTO ALUNOS2
SELECT * FROM ALUNOS;

-- VERIFICANDO TABELA 2
SELECT * FROM ALUNOS2;

-- Criando tabela com select
SELECT * 
INTO ALUNOS3
FROM ALUNOS;

-- VERIFICANDO TABELA 3
SELECT * FROM ALUNOS3;

-- COLOCANDO O BD EM USO
USE PEDIDOS

-- ALTERAR DADOS DE UMA COLUNA
-- AUMENTAR O SALÁRIO DE TODOS OS FUNCIONÁRIOS EM 20%
SELECT NOME, SALARIO, SALARIO *1.2 FROM TB_EMPREGADO

UPDATE TB_EMPREGADO
SET SALARIO = SALARIO * 1.2 --SALARIO *= 1.2

-- SOMAR 2 NA QUANTIDADE DE DEPENDENTES DO FUNCIONÁRIO DE
-- CÓDIGO 5
UPDATE TB_EMPREGADO
SET NUM_DEPEND = NUM_DEPEND + 2 --NUM_DEPEND += 2
WHERE CODFUN = 5

-- ALTERAR OS DADOS DO CLIENTE DE CÓDIGO 5
UPDATE TB_CLIENTE
SET ENDERECO = 'AV. PAULISTA, 1009 - 10 AND',
    BAIRRO   = 'CERQUEIRA CESAR',
    CIDADE   = 'SÃO PAULO'
WHERE CODCLI = 5

-- CONFERIR O RESULTADO DA ALTERAÇÃO
SELECT * FROM TB_CLIENTE WHERE CODCLI = 5

-- ALTERAR OS DADOS DO GRUPO DE PRODUTOS
UPDATE TB_PRODUTO 
SET QTD_ESTIMADA = QTD_REAL,
                    CLAS_FISC = '96082000',
                    IPI = 8
WHERE COD_TIPO = 5

-- A LINHA A SEGUIR CONFERE O RESULTADO DA ALTERAÇÃO
SELECT * FROM TB_PRODUTO
WHERE COD_TIPO = 5


-- CRIAR COPIA DE UMA TABELA
SELECT * 
INTO EMPREGADOS_TMP 
FROM TB_EMPREGADO

-- EXCLUINDO EMPREGADOS COM SALARIO SUPERIOR A R$ 5000
SELECT * FROM EMPREGADOS_TMP WHERE SALARIO > 5000

DELETE FROM EMPREGADOS_TMP WHERE SALARIO > 5000

SELECT * FROM EMPREGADOS_TMP WHERE SALARIO > 5000


--EXCLUINDO EMPREGADOS 3, 5, 7
DELETE EMPREGADOS_TMP WHERE CODFUN IN (3,5,7)

SELECT * FROM EMPREGADOS_TMP WHERE CODFUN IN (3,5,7)

-- EXCLUINDO TODOS EMPREGADOS
DELETE FROM EMPREGADOS_TMP
-- OU
TRUNCATE TABLE EMPREGADOS_TMP
--
SELECT * FROM EMPREGADOS_TMP