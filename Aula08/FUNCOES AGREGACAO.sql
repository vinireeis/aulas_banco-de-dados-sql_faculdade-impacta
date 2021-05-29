-- FUNCOES DE AGREGA��O
SELECT
	SUM(SALARIO)			AS TOTAL_SALARIO,				-- soma sal�rios
	COUNT(*)					AS QTD_EMPREGADOS,				-- contagem de quantos empregados
	COUNT(SALARIO)				AS QTD_EMPREGADOS_ASSALARIADOS, -- contagem de quantos tem salario != de nulo
	COUNT(DISTINCT SALARIO)		AS QTD_UNIQUE_SALARIO,			-- contagem de sal�rios diferentes (ou �nicos)
	MAX(PREMIO_MENSAL)			AS MAIOR_PREMIO,				-- maior pr�mio da coluna
	MIN(PREMIO_MENSAL)			AS MENOR_PREMIO,				-- menor pr�mio da coluna
	AVG(PREMIO_MENSAL)			AS PREMIO_MEDIO,				-- m�dia aritim�tica
	SUM(PREMIO_MENSAL)			AS TOTAL_PREMIO,				-- valor total gasto em Premio mensal
	AVG(PREMIO_MENSAL)			AS PREMIO_MEDIO,				-- Premio mensal m�dio
	AVG(ISNULL(PREMIO_MENSAL, 0))	AS PREMIO_MEDIO_TRATADO			-- Premio m�dio sem nulos
FROM TB_EMPREGADO

SELECT * FROM TB_EMPREGADO