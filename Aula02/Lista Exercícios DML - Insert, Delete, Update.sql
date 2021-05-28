--SELECTS CONSULTA
SELECT * FROM TB_EMPREGADO
SELECT * FROM TB_VENDEDOR
SELECT * FROM TB_DEPARTAMENTO
SELECT * FROM TB_CARGO
SELECT * FROM TB_PRODUTO

--Insira dois novos vendedores (tb_vendedor), utilize INSERT POSICIONAL
INSERT INTO TB_VENDEDOR (nome) VALUES ('Vinicius')
INSERT INTO TB_VENDEDOR (nome) VALUES ('Larissa')
-- ou INSERT INTO TB_VENDEDOR (nome) VALUES ('Vinicius'), ('Larissa')

--Insira um novo empregado (tb_empregado) que deve trabalhar no departamento
--PESSOAL e que tenha o cargo MOTORISTA.
INSERT INTO TB_EMPREGADO (NOME, COD_DEPTO, COD_CARGO) VALUES ('Vinicius Reis', '1', '7')

--Aumente o preço de custo de todos os produtos do tipo 2 em 15%;
UPDATE TB_PRODUTO 
SET	PRECO_CUSTO = PRECO_CUSTO * 1.15 
WHERE COD_TIPO = 2

--Faça com que os preços de venda dos produtos do tipo 2 fiquem 30% acima do preço de custo;
UPDATE TB_PRODUTO 
SET PRECO_VENDA = PRECO_VENDA * 1.30 
WHERE COD_TIPO = 2

--Altere o campo IPI de todos os produtos com COD_TIPO = 3 para 5;
UPDATE TB_PRODUTO 
SET IPI = 5 
WHERE COD_TIPO = 3

SELECT * FROM TB_PRODUTO WHERE COD_TIPO = 3 -- consultando resultado

--Reduza em 10% o campo QTD_MINIMA de todos os produtos (multiplique QTD_MINIMA por 0.9);
UPDATE TB_PRODUTO SET QTD_MINIMA = QTD_MINIMA * 0.9 

-- Altere os seguintes campos do cliente de código 11:
-- ENDERECO: AV. CELSO GARCIA, 1234;
-- BAIRRO: TATUAPE;
-- CIDADE: SAO PAULO;
-- ESTADO: SP;
-- CEP: 03407080.

SELECT * FROM TB_CLIENTE WHERE CODCLI = 11 -- consultando dados do cliente código 11

UPDATE TB_CLIENTE 
SET ENDERECO = 'AV. CELSO GARCIA, 1234',
	BAIRRO = 'TATUAPE',
	CIDADE = 'SAO PAULO',
	ESTADO = 'SP',
	CEP = '03407080'
WHERE CODCLI = 11

-- Copie ENDERECO, BAIRRO, CIDADE, ESTADO e CEP do cliente código 13 para os campos
-- END_COB, BAI_COB, CID_COB, EST_COB e CEP_COB do mesmo cliente;
UPDATE TB_CLIENTE
SET END_COB = ENDERECO,
	BAI_COB = BAIRRO,
	CID_COB = CIDADE,
	EST_COB = ESTADO,
	CEP_COB = CEP
WHERE CODCLI = 13

SELECT * FROM TB_CLIENTE WHERE CODCLI = 13 -- consultando pós atualização

-- Altere a tabela CLIENTES, mudando o conteúdo do campo ICMS de clientes dos estados
--RJ, RO, AC, RR, MG, PR, SC, RS, MS, MT para 12;
UPDATE TB_CLIENTE
SET ICMS = 12
WHERE ESTADO IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT')

SELECT * FROM TB_CLIENTE WHERE ESTADO IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT')

-- Altere os campos ICMS de todos os clientes de SP para 18;
UPDATE TB_CLIENTE
SET ICMS = 18
WHERE ESTADO = 'SP'

SELECT * FROM TB_CLIENTE WHERE ESTADO = 'SP'

-- Altere o campo ICMS para 7 para clientes que não sejam dos estados RJ, RO, AC, RR, MG,
-- PR, SC, RS, MS, MT, SP;
UPDATE TB_CLIENTE
SET ICMS = 7
WHERE ESTADO NOT IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT', 'SP')

-- Altere para 7 o campo DESCONTO da tabela ITENSPEDIDO, mas somente dos itens do produto 
-- com ID_PRODUTO = 8, com data de entrega em janeiro de 2007 e com QUANTIDADE acima de 1000;
UPDATE TB_ITENSPEDIDO
SET DESCONTO = 7
WHERE ID_PRODUTO = 8 
AND DATA_ENTREGA BETWEEN '20170101' AND '20170131'
AND QUANTIDADE > 1000
-- ou podemos fazer assim
UPDATE TB_ITENSPEDIDO
SET DESCONTO = 7
WHERE ID_PRODUTO = 8
AND DATA_ENTREGA >= '20070101'
AND DATA_ENTREGA < '20070201'
AND QUANTIDADE > 1000

SELECT * FROM TB_ITENSPEDIDO WHERE ID_PRODUTO = 8 AND DATA_ENTREGA BETWEEN '20170101' AND '20170131' -- consulta

-- Zere o campo DESCONTO de todos os itens de pedido com quantidade abaixo de 1000,
-- data de entrega posterior a 1-Junho-2007 e que tenham desconto acima de zero;
UPDATE TB_ITENSPEDIDO
SET DESCONTO = 0
WHERE QUANTIDADE < 1000
AND DATA_ENTREGA > '20070601'
AND DESCONTO > 0

SELECT * FROM TB_ITENSPEDIDO WHERE QUANTIDADE < 1000 AND DATA_ENTREGA > '20070601' AND DESCONTO > 0

--Usando SELECT INTO, gere uma cópia da tabela VENDEDORES com o nome de VENDEDORES_TMP;
SELECT *
INTO VENDEDORES_TMP
FROM TB_VENDEDOR

SELECT * FROM VENDEDORES_TMP

-- Exclua de VENDEDORES_TMP os registros com CODVEN acima de 5;

DELETE FROM VENDEDORES_TMP -- FROM NO DELETE NO SQL SERVER É OPCIONAL
WHERE CODVEN > 5;

-- Exclua todos os registros restantes da tabela VENDEDORES_TMP;
DELETE FROM VENDEDORES_TMP
-- OU
TRUNCATE TABLE VENDEDORES_TMP -- (TRUNCATE É DDL)

-- EXCLUIR A TABELA
DROP TABLE VENDEDORES_TMP

SELECT * FROM VENDEDORES_TMP



