--SELECTS CONSULTA
SELECT * FROM TB_EMPREGADO
SELECT * FROM TB_VENDEDOR
SELECT * FROM TB_DEPARTAMENTO
SELECT * FROM TB_CARGO
SELECT * FROM TB_PRODUTO

--Insira dois novos vendedores (tb_vendedor), utilize INSERT POSICIONAL
INSERT INTO TB_VENDEDOR (nome) VALUES ('Vinicius')
INSERT INTO TB_VENDEDOR (nome) VALUES ('Larissa')

--Insira um novo empregado (tb_empregado) que deve trabalhar no departamento
--PESSOAL e que tenha o cargo MOTORISTA.
INSERT INTO TB_EMPREGADO (NOME, COD_DEPTO, COD_CARGO) VALUES ('Vinicius Reis', '1', '7')

--Aumente o preço de custo de todos os produtos do tipo 2 em 15%;

UPDATE TB_PRODUTO SET PRECO_CUSTO = PRECO_CUSTO * 1.15 WHERE COD_TIPO = 2
UPDATE TB_PRODUTO SET PRECO_VENDA = PRECO_VENDA * 1.30 WHERE COD_TIPO = 2