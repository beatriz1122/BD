CREATE DATABASE clinica
GO
USE clinica
GO
CREATE TABLE paciente (
num_beneficiario		INT				NOT NULL,
nome					VARCHAR(100)	NOT NULL,
logradouro				VARCHAR(200)	NOT NULL,
numero					INT				NOT NULL,
cep						CHAR(8)			NOT NULL,
complemento				VARCHAR(255)	NOT NULL,
telefone				VARCHAR(11)		NOT NULL
PRIMARY KEY (num_beneficiario)
)
GO
CREATE TABLE especialidade (
id						INT				NOT NULL,
especialidade			VARCHAR(100)	NOT NULL
PRIMARY KEY (id)
)
GO
CREATE TABLE medico (
codigo					INT				NOT NULL,
nome					VARCHAR(100)	NOT NULL,
logradouro				VARCHAR(200)	NOT NULL,
numero					INT				NOT NULL,
cep						CHAR(8)			NOT NULL,
complemento				VARCHAR(255)	NOT NULL,
contato					VARCHAR(11)		NOT NULL,
especialidadeID			INT				NOT NULL
PRIMARY KEY (codigo)
FOREIGN KEY (especialidadeID) REFERENCES especialidade(id)
)
GO
CREATE TABLE consulta (
pacienteNum_Beneficiario	INT				NOT NULL,
medicoCodigo				INT				NOT NULL,
data_hora					DATETIME		NOT NULL,
observacao					VARCHAR(255)	NOT NULL
PRIMARY KEY (pacienteNum_Beneficiario, medicoCodigo, data_hora)
FOREIGN KEY (pacienteNum_Beneficiario) references paciente(num_beneficiario),
FOREIGN KEY (medicoCodigo) references medico(codigo)
)
GO
INSERT INTO paciente VALUES 
(99901, 'Washington Silva', 'R. Anhaia', 150, '02345000', 'Casa', '922229999'),
(99902, 'Luis Ricardo', 'R. Voluntarios da Patria', 2251, '03254010', 'Bloco B. Apto 25', '923450987'),
(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, '06987020', 'Apto 1208', '912348765'),
(99904, 'José Araujo', 'R. XV de Novembro', 18, '03678000', 'Casa', '945674312'),
(99905, 'Joana Paula', 'R. 7 de Abril', 97, '01214000', 'Conjunto 3 - Apto 801', '912095674')
GO
INSERT INTO especialidade VALUES
(1, 'Otorrinolaringologista'),
(2, 'Urologista'),
(3, 'Geriatra'),
(4, 'Pediatra')
GO
INSERT INTO medico VALUES 
(100001, 'Ana Paula', 'R. 7 de Setemebro', 256, '03698000', 'Casa', '915689456', 1),
(100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', '923235454', 1),
(100003, 'Lucas Borges', 'Av. do Estado', 3210, '05241000', 'Apto 205', '963638585', 2),
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', '932458745', 3)
GO
INSERT INTO consulta VALUES
(99901, 100002, '2021-09-04 13:20', 'Infecção Urina'),
(99902, 100003, '2021-09-04 13:15', 'Gripe'),
(99901, 100001, '2021-09-04 12:30', 'Infecção Garganta')

SELECT * FROM paciente
SELECT * FROM especialidade
SELECT * FROM medico
SELECT * FROM consulta

ALTER TABLE medico
ADD dia_atendimento VARCHAR(10) NULL

UPDATE medico
SET dia_atendimento = '2a Feira'
WHERE codigo = 100001 OR codigo = 100003
GO
UPDATE medico
SET dia_atendimento = '4a Feira'
WHERE codigo = 100002
GO
UPDATE medico
SET dia_atendimento = '5a Feira'
WHERE codigo = 100004

EXEC sp_rename 'dbo.medico.dia_atendimento','dia_semana_atendimento', 'COLUMN'

UPDATE medico
SET logradouro = 'Av. Bras Leme', numero = 876, cep = '02122000', complemento = 'Apto 504'
WHERE nome = 'Lucas Borges'

ALTER TABLE consulta
ALTER COLUMN observacao VARCHAR(200) NOT NULL