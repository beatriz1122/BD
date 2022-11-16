CREATE DATABASE selects1
GO
USE selects1
GO
CREATE TABLE funcionario(
id          INT             IDENTITY(1,1)					NOT NULL,
nome        VARCHAR(100)									NOT NULL,
sobrenome   VARCHAR(200)									NOT NULL,
logradouro  VARCHAR(200)									NOT NULL,
numero      INT             CHECK(numero > 0)				NOT NULL,
bairro      VARCHAR(100)									NULL,
cep         CHAR(8)         CHECK(LEN(cep) = 8)				NULL,
ddd         CHAR(2)			DEFAULT('11')					NULL,
telefone    CHAR(8)         CHECK(LEN(telefone) = 8)		NULL,
data_nasc   DATETIME        CHECK(data_nasc < GETDATE())	NOT NULL,
salario     DECIMAL(7,2)    CHECK(salario > 0.00)			NOT NULL
PRIMARY KEY(id)
)
GO
CREATE TABLE projeto(
codigo      INT             IDENTITY(1001, 1)		NOT NULL,
nome        VARCHAR(200)    UNIQUE					NOT NULL,
descricao   VARCHAR(300)							NULL
PRIMARY KEY(codigo)
)
GO
CREATE TABLE funcproj(
id_funcionario  INT         NOT NULL,
codigo_projeto  INT         NOT NULL,
data_inicio     DATETIME    NOT NULL,
data_fim        DATETIME    NOT NULL
PRIMARY KEY (id_funcionario, codigo_projeto)
FOREIGN KEY (id_funcionario) REFERENCES funcionario (id),
FOREIGN KEY (codigo_projeto) REFERENCES projeto (codigo),
CONSTRAINT chk_dt CHECK(data_inicio < data_fim)
)
/*GO
INSERT INTO funcionario (nome, sobrenome, logradouro, numero, bairro, cep, telefone, data_nasc, salario) VALUES
('Fulano',	'da Silva',	'R. Voluntários da Patria',	8150,	'Santana',	'05423110',	'76895248',	'15/05/1974',	4350.00),
('Cicrano',	'De Souza',	'R. Anhaia', 353,	'Barra Funda',	'03598770',	'99568741',	'25/08/1975',	1552.00),
('Beltrano',	'Dos Santos',	'R. ABC', 1100,	'Artur Alvim',	'05448000',	'25639854',	'02/06/1963',	2250.00)
GO
INSERT INTO funcionario (nome, sobrenome, logradouro, numero, bairro, cep, ddd, telefone, data_nasc, salario) VALUES
('Tirano',	'De Souza',	'Avenida Águia de Haia', 4430,	'Artur Alvim',	'05448000',	NULL,	NULL,	'15/10/1975',	2804.00)
GO
INSERT INTO projeto VALUES
('Implantação de Sistemas','Colocar o sistema no ar'),
('Modificação do módulo de cadastro','Modificar CRUD'),
('Teste de Sistema de Cadastro',NULL)
GO
INSERT INTO funcproj VALUES
(1, 1001, '18/04/2015', '30/04/2015'),
(3, 1001, '18/04/2015', '30/04/2015'),
(1, 1002, '06/05/2015', '10/05/2015'),
(2, 1002, '06/05/2015', '10/05/2015'),
(3, 1003, '11/05/2015', '13/05/2015')
 */
SELECT * FROM funcionario
SELECT * FROM projeto
SELECT * FROM funcproj

--Funções importantes
--Tamanho do CHAR
SELECT LEN('Banco de Dados')

--Dia e Hora (DATETIME) do sistema
SELECT GETDATE()

--Conversão de Tipos
SELECT CAST(11 AS VARCHAR(2)) AS num_to_char
SELECT CAST('11' AS INT) AS char_to_int
SELECT CAST('a' AS INT) AS char_to_int

--Conversão na SQL SERVER
SELECT CONVERT(VARCHAR(2), 11) AS num_to_char
SELECT CONVERT(INT,'11') AS char_to_num
SELECT CONVERT(INT, 'a') AS char_to_num

--Converter de datas
SELECT CONVERT(CHAR(10), GETDATE(), 103) AS hoje
SELECT CONVERT(CHAR(5), GETDATE(), 108) AS agora