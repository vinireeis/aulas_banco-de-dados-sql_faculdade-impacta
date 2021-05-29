-- FUNCOES DE AGREGAÇÂO
SELECT
	SUM(SALARIO)			AS TOTAL_SALARIO,				-- soma salários
	COUNT(*)					AS QTD_EMPREGADOS,				-- contagem de quantos empregados
	COUNT(SALARIO)				AS QTD_EMPREGADOS_ASSALARIADOS, -- contagem de quantos tem salario != de nulo
	COUNT(DISTINCT SALARIO)		AS QTD_UNIQUE_SALARIO,			-- contagem de salários diferentes (ou únicos)
	MAX(PREMIO_MENSAL)			AS MAIOR_PREMIO,				-- maior prêmio da coluna
	MIN(PREMIO_MENSAL)			AS MENOR_PREMIO,				-- menor prêmio da coluna
	AVG(PREMIO_MENSAL)			AS PREMIO_MEDIO,				-- média aritimética
	SUM(PREMIO_MENSAL)			AS TOTAL_PREMIO,				-- valor total gasto em Premio mensal
	AVG(PREMIO_MENSAL)			AS PREMIO_MEDIO,				-- Premio mensal médio
	AVG(ISNULL(PREMIO_MENSAL, 0))	AS PREMIO_MEDIO_TRATADO			-- Premio médio sem nulos
FROM TB_EMPREGADO

SELECT * FROM TB_EMPREGADO