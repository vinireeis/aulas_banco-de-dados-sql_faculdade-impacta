--Utilizando a tabela de produtos, selecione as colunas DESCRICAO, COD_PRODUTO, QTD_REAL, QTD_MINIMA 
--calcule a diferen�a da quantidade (real - m�nima) e "apelide" como "diferença de qtd" *

SELECT DESCRICAO, COD_PRODUTO, QTD_REAL, QTD_MINIMA, QTD_REAL - QTD_MINIMA AS DIFERENCA_DE_QTD FROM TB_PRODUTO

--Voc� est� atuando em um equipe de desenvolvimento e ser� preciso desenvolver uma consulta sql para 
--exibir um �nico fornecedor que tenha a maior c�digo de fornecedor, o nome comece com M e que o c�digo pa�s seja maior que 0. *

SELECT TOP 1 COD_FORNECEDOR, NOME, COD_PAIS FROM TB_FORNECEDOR WHERE NOME LIKE 'M%' and COD_PAIS >0 ORDER BY COD_FORNECEDOR DESC

SELECT COD_FORNECEDOR, NOME, COD_PAIS FROM TB_FORNECEDOR ORDER BY COD_FORNECEDOR DESC

--Selecione todas as colunas da tabela TB_EMPREGADO dos 11 primeiros registros.

SELECT TOP 11 * FROM TB_EMPREGADO ORDER BY CODFUN ASC

-- Vinicius, monte um SELECT que retorne todos os pedidos de 2019 que a situa��o seja entregue ('E'). 
--Ordene primeiro pelo c�digo do vendedor decrescentemente e depois os pedidos do maior para o menor valor. *

SELECT * FROM TB_PEDIDO

SELECT * FROM TB_PEDIDO WHERE DATA_EMISSAO >= '20190101' and DATA_EMISSAO <= '20191231' AND SITUACAO = 'E' ORDER BY CODVEN DESC, VLR_TOTAL DESC