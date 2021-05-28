use db_vendas

SELECT CODFUN, NOME, COD_DEPTO FROM TB_EMPREGADO

SELECT * FROM TB_DEPARTAMENTO

-- RETORNANDO DADOS DOS EMPREGADOS E SEUS RESPECTIVOS DEPARTAMENTOS
SELECT
	TB_EMPREGADO.CODFUN,
	TB_EMPREGADO.NOME,
	TB_EMPREGADO.COD_DEPTO,
	TB_DEPARTAMENTO.COD_DEPTO,
	TB_DEPARTAMENTO.DEPTO
FROM TB_DEPARTAMENTO		
INNER JOIN	TB_EMPREGADO -- INNER JOIN = JOIN
ON  TB_DEPARTAMENTO.COD_DEPTO = TB_EMPREGADO.COD_DEPTO

SELECT
	EMP.CODFUN,
	EMP.NOME,
	EMP.COD_DEPTO,
	DEP.COD_DEPTO,
	DEP.DEPTO
FROM TB_DEPARTAMENTO AS DEP		
INNER JOIN	TB_EMPREGADO AS EMP -- INNER JOIN = JOIN
	ON  DEP.COD_DEPTO = EMP.COD_DEPTO

-- DADOS DOS EMPREGADOS E SEUS RESPECTIVOS DEPARTAMENTOS E CARGOS
SELECT
	TB_EMPREGADO.NOME,
	TB_EMPREGADO.COD_DEPTO,
	TB_DEPARTAMENTO.*,
	TB_EMPREGADO.COD_CARGO,
	TB_CARGO.*
FROM TB_EMPREGADO
JOIN TB_CARGO	ON TB_EMPREGADO.COD_CARGO = TB_CARGO.COD_CARGO	
JOIN TB_DEPARTAMENTO  ON TB_EMPREGADO.COD_DEPTO = TB_DEPARTAMENTO.COD_DEPTO 

-- PEDIDOS EMITIDOS EM JAN/2017 (TRAZER DADOS DO PEDIDO, DOS ITENS, PRODUTO, COR, UNIDADE, PRODUTO)
SELECT
   *
FROM TB_COR
INNER JOIN TB_ITENSPEDIDO
	ON TB_COR.CODCOR = TB_ITENSPEDIDO.CODCOR
INNER JOIN TB_PEDIDO 
	ON TB_PEDIDO.NUM_PEDIDO = TB_ITENSPEDIDO.NUM_PEDIDO
INNER JOIN TB_PRODUTO
	ON TB_PRODUTO.ID_PRODUTO = TB_ITENSPEDIDO.ID_PRODUTO
INNER JOIN TB_TIPOPRODUTO
	ON TB_TIPOPRODUTO.COD_TIPO = TB_PRODUTO.COD_TIPO
INNER JOIN TB_UNIDADE
	ON TB_UNIDADE.COD_UNIDADE = TB_PRODUTO.COD_UNIDADE

-- SELF-JOIN RELACIONAMENTO DA TABELA COM ELA PR�PRIA
SELECT * FROM TB_EMPREGADO

-- C�digo do funcion�rio, nome do funcion�rio, c�digo do supervisor e nome do supervisor
SELECT 
	EMPREGADO.CODFUN			[C�DIGO FUNCION�RIO],
	EMPREGADO.NOME				[NOME FUNCION�RIO],
	EMPREGADO.COD_SUPERVISOR	[C�DIGO SUPERVISOR],
	SUPERVISOR.NOME				[NOME SUPERVISOR]
FROM TB_EMPREGADO AS EMPREGADO
	INNER JOIN TB_EMPREGADO AS SUPERVISOR
		ON EMPREGADO.COD_SUPERVISOR = SUPERVISOR.CODFUN

-- RETORNANDO DADOS DOS EMPREGADOS E SEUS RESPECTIVOS DEPARTAMENTOS
SELECT
	TB_EMPREGADO.CODFUN,
	TB_EMPREGADO.NOME,
	TB_EMPREGADO.COD_DEPTO,
	TB_DEPARTAMENTO.COD_DEPTO,
	TB_DEPARTAMENTO.DEPTO
FROM TB_EMPREGADO	
LEFT JOIN	 TB_DEPARTAMENTO -- LEFT OUTER JOIN = LEFT JOIN
ON  TB_DEPARTAMENTO.COD_DEPTO = TB_EMPREGADO.COD_DEPTO

--RETORNANDO EMPREGADOS SEM DEPARTAMENTO
SELECT
	TB_EMPREGADO.CODFUN,
	TB_EMPREGADO.NOME,
	TB_EMPREGADO.COD_DEPTO,
	TB_DEPARTAMENTO.COD_DEPTO,
	TB_DEPARTAMENTO.DEPTO
FROM TB_EMPREGADO	
LEFT JOIN	 TB_DEPARTAMENTO -- LEFT OUTER JOIN = LEFT JOIN
ON  TB_DEPARTAMENTO.COD_DEPTO = TB_EMPREGADO.COD_DEPTO
WHERE TB_DEPARTAMENTO.COD_DEPTO IS NULL


-- RETORNANDO DADOS DOS DEPARTAMENTOS E SEUS RESPECTIVOS EMPREGADOS
SELECT
	TB_EMPREGADO.CODFUN,
	TB_EMPREGADO.NOME,
	TB_EMPREGADO.COD_DEPTO,
	TB_DEPARTAMENTO.COD_DEPTO,
	TB_DEPARTAMENTO.DEPTO
FROM TB_EMPREGADO	
RIGHT JOIN	 TB_DEPARTAMENTO -- RIGHT OUTER JOIN = RIGHT JOIN
ON  TB_DEPARTAMENTO.COD_DEPTO = TB_EMPREGADO.COD_DEPTO

--RETORNANDO DEPARTAMENTOS SEM EMPREGADOS
SELECT
	TB_DEPARTAMENTO.DEPTO
FROM TB_EMPREGADO	
RIGHT JOIN	 TB_DEPARTAMENTO 
ON  TB_DEPARTAMENTO.COD_DEPTO = TB_EMPREGADO.COD_DEPTO
WHERE TB_EMPREGADO.COD_DEPTO IS NULL

-- RETORNANDO DADOS DOS DEPARTAMENTOS E SEUS RESPECTIVOS EMPREGADOS, 
-- EMPREGADOS SEM DEPARTAMENTO E DEPARTAMENTO SEM EMPREGADO
SELECT
	TB_EMPREGADO.CODFUN,
	TB_EMPREGADO.NOME,
	TB_EMPREGADO.COD_DEPTO,
	TB_DEPARTAMENTO.COD_DEPTO,
	TB_DEPARTAMENTO.DEPTO
FROM TB_EMPREGADO	
FULL JOIN	 TB_DEPARTAMENTO -- FULL OUTER JOIN = FULL JOIN
ON  TB_DEPARTAMENTO.COD_DEPTO = TB_EMPREGADO.COD_DEPTO

-- EMPREGADOS SEM DEPARTAMENTO OU  DEPARTAMENTO SEM EMPREGADO
SELECT
	TB_EMPREGADO.NOME,
	TB_DEPARTAMENTO.DEPTO
FROM TB_EMPREGADO	
FULL JOIN	 TB_DEPARTAMENTO 
ON  TB_DEPARTAMENTO.COD_DEPTO = TB_EMPREGADO.COD_DEPTO
WHERE TB_DEPARTAMENTO.COD_DEPTO IS NULL OR
TB_EMPREGADO.COD_DEPTO IS NULL

-- DATA DO PEDIDO, QUEM VENDEU (NOME VENDEDOR), QUEM COMPROU (NOME CLIENTE) E O VALOR.
SELECT 
	TB_PEDIDO.DATA_EMISSAO,
	TB_VENDEDOR.NOME AS VENDEDOR,
	TB_CLIENTE.NOME	 AS CLIENTE,
	TB_PEDIDO.VLR_TOTAL
FROM TB_PEDIDO
	LEFT JOIN TB_CLIENTE ON TB_PEDIDO.CODCLI = TB_CLIENTE.CODCLI
	LEFT JOIN TB_VENDEDOR ON TB_PEDIDO.CODVEN = TB_VENDEDOR.CODVEN