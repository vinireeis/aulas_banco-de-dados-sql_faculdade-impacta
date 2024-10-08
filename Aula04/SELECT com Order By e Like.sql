-- COLOCANDO O BD_VENDAS EM USO (TODOS POSSUEM ACESSO DE LEITURA)
USE DB_VENDAS;

-- SELECIONANDO TODAS COLUNAS
SELECT * FROM TB_EMPREGADO;

-- SELECIONANDO ALGUMAS COLUNAS
SELECT CODFUN, NOME, SALARIO FROM TB_EMPREGADO;

SELECT CODFUN, NOME, SALARIO, SALARIO * 1.10
FROM TB_EMPREGADO;

-- APELIDANDO COLUNAS E TABELAS
SELECT 
 CODFUN AS CODIGO_FUNCIONARIO, 
 NOME,
 SALARIO AS SALARIO_ATUAL,
 SALARIO * 1.10 AS SALARIO_MAIS_10_PORCENTO
FROM TB_EMPREGADO;

SELECT 
 CODFUN		CODIGO, 
 NOME		"NOME", 
 SALARIO		'SAL�RIO',
 DATA_ADMISSAO	[DATA DE ADMISS�O]
FROM TB_EMPREGADO AS EMP;

-- OPERADORES MATEM�TICOS
SELECT 
	NOME,
	SALARIO + PREMIO_MENSAL SALARIO_BONIFICADO,
	SALARIO * 12 SALARIO_ANUAL,
	SALARIO + PREMIO_MENSAL * 12 SALARIO_ANUAL_ERRO,
	(SALARIO + PREMIO_MENSAL) * 12 SALARIO_ANUAL_OK
FROM TB_EMPREGADO

-- VALORES DISTINTOS
SELECT DISTINCT
	SALARIO
FROM TB_EMPREGADO

SELECT DISTINCT
	COD_DEPTO,  SALARIO
FROM TB_EMPREGADO

--  ORDEM CRESCENTE
SELECT * FROM TB_EMPREGADO 
ORDER BY NOME ASC; -- ASC � OPCIONAL

--  ORDEM DECRESCENTE
SELECT * FROM TB_EMPREGADO 
ORDER BY SALARIO DESC; -- DESC � OBRIGAT�RIO

--  ORDEM PELA POSI��O DA COLUNA
SELECT CODFUN, NOME, SALARIO, SALARIO * 1.10 [SAL�RIO COM 10% DE AUMENTO]
FROM TB_EMPREGADO
ORDER BY 3;

--  ORDEM PELA POSI��O DA COLUNA
SELECT CODFUN, NOME, SALARIO, SALARIO * 1.10 [SAL�RIO COM 10% DE AUMENTO]
FROM TB_EMPREGADO
ORDER BY [SAL�RIO COM 10% DE AUMENTO];

--  10 EMPREGADO MAIS ANTIGOS
SELECT TOP 10 * FROM TB_EMPREGADO ORDER BY DATA_ADMISSAO;

--  5 EMPREGADO QUE GANHAM MAIS
SELECT TOP 5 * FROM TB_EMPREGADO ORDER BY SALARIO DESC;

--  5 EMPREGADO QUE GANHAM MAIS COM EMPATE
SELECT TOP 5 WITH TIES * FROM TB_EMPREGADO ORDER BY SALARIO DESC;

--  AMOSTRA DE 10% DA TABELA
SELECT TOP 10 PERCENT  CODFUN, NOME, SALARIO FROM TB_EMPREGADO
ORDER BY NEWID(); --ORDENA��O ALEAT�RIA

--  FUNCION�RIOS COM SAL�RIO ABAIXO DE 1000
SELECT CODFUN, NOME, COD_CARGO, SALARIO FROM TB_EMPREGADO
WHERE SALARIO < 1000
ORDER BY SALARIO;

--  FUNCION�RIOS COM SAL�RIO ACIMA DE 5000
SELECT CODFUN, NOME, COD_CARGO, SALARIO FROM TB_EMPREGADO
WHERE SALARIO > 5000
ORDER BY SALARIO;

--  FUNCION�RIOS COM CAMPO COD_DEPTO IGUAL A 2
SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO = 2

--  FUNCION�RIOS COM CAMPO COD_DEPTO IGUAL A 2 E SALARIO ACIMA DE 5000
SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO = 2 AND SALARIO > 5000

--  FUNCION�RIOS COM CAMPO COD_DEPTO IGUAL A 2 OU SALARIO ACIMA DE 5000
SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO = 2 OR SALARIO > 5000

--  FUNCION�RIOS COM CAMPO COD_DEPTO N�O IGUAL A 2 AND SALARIO ACIMA DE 5000
SELECT * FROM TB_EMPREGADO
WHERE NOT COD_DEPTO = 2 AND SALARIO > 5000

--  FUNCION�RIOS COM SALARIO ENTRE 3000 E 5000
SELECT * FROM TB_EMPREGADO
WHERE SALARIO BETWEEN 3000 AND 5000 ORDER BY SALARIO;

--  FUNCION�RIOS COM SALARIO MENOR QUE 3000 OU MAIOR QUE 5000
SELECT * FROM TB_EMPREGADO
WHERE SALARIO NOT BETWEEN 3000 AND 5000 ORDER BY SALARIO;

--  FUNCION�RIOS S�O DOS DEPARTAMENTOS 2,3,4
SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO IN (2,3,4)

--  FUNCION�RIOS QUE N�O S�O DOS DEPARTAMENTOS 2,3,4
SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO NOT IN (2,3,4)


-- EMPREGADOS COM NOME MARIA
SELECT * FROM TB_EMPREGADO
WHERE NOME = 'MARIA';

--  NOMES QUE COME�AM COM MARIA
SELECT * FROM TB_EMPREGADO
WHERE NOME LIKE 'MARIA%';

--  NOMES QUE TERMINAM COM MARIA
SELECT * FROM TB_EMPREGADO
WHERE NOME LIKE '%MARIA';

--  NOMES QUE CONTENHAM SOUZA
SELECT * FROM TB_EMPREGADO
WHERE NOME LIKE '%SOUZA%';

--  NOMES QUE CONTENHAM SOUZA OU SOUSA
SELECT * FROM TB_EMPREGADO
WHERE NOME LIKE '%SOU[SZ]A%'; -- NOME LIKE '%SOUZA%' OR NOME LIKE '%SOUSA%'

--  INICIADOS POR QUALQUER CARACTERE E SEGUNDO CARACTERE A
SELECT * FROM TB_EMPREGADO
WHERE NOME LIKE '_A%';

--  NOMES CUJO PEN�LTIMO CARACTERE SEJA A LETRA Z
SELECT * FROM TB_EMPREGADO
WHERE NOME LIKE '%Z_';

--  NOMES TERMINADOS EM LU E SEGUIDOS DE 3 OUTRAS LETRAS
SELECT * FROM TB_EMPREGADO
WHERE NOME LIKE '%LU___';

-- NOMES QUE CONTENHAM PRIMEIRA LETRA SEJA M OU P
-- E TERMINEM COM A OU O
SELECT * FROM TB_EMPREGADO
WHERE NOME LIKE '[MP]%[AO]'


--  EMPREGADO SEM SAL�RIO
SELECT CODFUN, NOME, SALARIO, PREMIO_MENSAL
FROM TB_EMPREGADO
WHERE SALARIO IS NULL;

--  EMPREGADO COM SAL�RIO
SELECT CODFUN, NOME, SALARIO, PREMIO_MENSAL
FROM TB_EMPREGADO
WHERE SALARIO IS NOT NULL;

--  TRATANDO NULOS
SELECT 
	CODCLI, 
	NOME, 
	ISNULL(ESTADO, 'N�O INFORMADO') ESTADO_TRATADO, 
	COALESCE(EST_COB,ESTADO,'NC') AS EST_COBRANCA, 
	EST_COB, 
	ESTADO
FROM TB_CLIENTE ORDER BY 3;