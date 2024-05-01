CREATE DATABASE clinica_medica
GO
USE clinica_medica
GO
CREATE TABLE paciente(
	cpf VARCHAR(14) PRIMARY KEY,
	nome_paciente VARCHAR(40),
	telefone VARCHAR(14),
	numero_plano INT, 
	nome_plano VARCHAR(20),
	tipo_plano VARCHAR(10)
)

GO 

CREATE TABLE medico(
	crm INT PRIMARY KEY,
	nome_medico VARCHAR(30),
	especialidade VARCHAR(20)
)

GO 

CREATE TABLE exame(
	codigo INT PRIMARY KEY,
	especializacao VARCHAR(20),
	preco MONEY
)

GO 

CREATE TABLE consulta(
	numero_consulta INT IDENTITY PRIMARY KEY,
	data_consulta DATE,
	horario_consulta TIME,
	fk_paciente_cpf VARCHAR(14),
	fk_medico_crm INT,
	FOREIGN KEY (fk_paciente_cpf) REFERENCES paciente(cpf) ON DELETE CASCADE,
	FOREIGN KEY (fk_medico_crm) REFERENCES medico(crm)
)

GO 

CREATE TABLE pedido_exame(
	numero_pedido INT IDENTITY PRIMARY KEY,
	resultado VARCHAR(40),
	data_exame DATE,
	valor_pagar MONEY,
	fk_consulta_numero_consulta INT,
	fk_exame_codigo INT,
	FOREIGN KEY (fk_consulta_numero_consulta) REFERENCES consulta(numero_consulta),
	FOREIGN KEY (fk_exame_codigo) REFERENCES exame(codigo) ON DELETE CASCADE
)
GO 

INSERT INTO paciente (cpf, nome_paciente, telefone, numero_plano, nome_plano, tipo_plano)
VALUES 
    ('123.456.789-00', 'Maria Silva', '(11) 91234-5678', 12345, 'Plano Saúde', 'Particular'),
    ('987.654.321-00', 'João Oliveira', '(21) 98765-4321', 54321, 'Plano Bem-Estar', 'Corporativo'),
    ('111.222.333-44', 'Pedro Santos', '(31) 12345-6789', 67890, 'Plano Vida', 'Familiar'),
    ('555.666.777-88', 'Ana Souza', '(41) 55555-8888', 13579, 'Plano Saúde', 'Empresarial');

INSERT INTO medico (crm, nome_medico, especialidade)
VALUES 
    (123456, 'Dr. José Santos', 'Clínico Geral'),
    (654321, 'Dra. Ana Souza', 'Pediatra'),
    (987654, 'Dr. Carlos Silva', 'Dermatologista'),
    (111222, 'Dra. Laura Oliveira', 'Cardiologista');

INSERT INTO exame (codigo, especializacao, preco)
VALUES 
    (1, 'Hematologia', 150.00),
    (2, 'Radiografia', 200.00),
    (3, 'Ultrassonografia', 250.00),
    (4, 'Eletrocardiograma', 180.00);

INSERT INTO consulta (data_consulta, horario_consulta, fk_paciente_cpf, fk_medico_crm)
VALUES 
    ('2024-05-01', '09:00:00', '123.456.789-00', 123456),
    ('2024-05-02', '10:30:00', '987.654.321-00', 654321),
    ('2024-05-03', '11:00:00', '111.222.333-44', 987654),
    ('2024-05-04', '14:00:00', '555.666.777-88', 111222);

INSERT INTO pedido_exame (resultado, data_exame, valor_pagar, fk_consulta_numero_consulta, fk_exame_codigo)
VALUES 
    ('Normal', '2024-05-01', 150.00, 1, 1),
    ('Anormal', '2024-05-02', 200.00, 2, 2),
    ('Normal', '2024-05-03', 250.00, 3, 3),
    ('Anormal', '2024-05-04', 180.00, 4, 4);

UPDATE paciente
SET numero_plano = 99999
WHERE cpf = '123.456.789-00';

UPDATE medico
SET nome_medico = 'Dr. Marcelo Oliveira'
WHERE crm = 123456;

DELETE FROM paciente
WHERE cpf = '987.654.321-00';

DELETE FROM exame
WHERE codigo = 3;