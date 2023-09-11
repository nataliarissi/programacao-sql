-- Criando a base de dados
CREATE DATABASE Atividade;
GO
USE Atividade;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'aluno')
BEGIN
    CREATE TABLE aluno (
        id INT PRIMARY KEY NOT NULL,
        nome VARCHAR(100) NOT NULL,
        matricula VARCHAR(50) NOT NULL,
        data_nascimento DATE NOT NULL,
        data_matricula DATE NOT NULL
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'prova')
BEGIN
    CREATE TABLE prova (
        id INT PRIMARY KEY NOT NULL,
        data_realizacao DATE NOT NULL,
        descricao VARCHAR(255) NOT NULL
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'nota')
BEGIN
    CREATE TABLE nota (
        aluno_id INT NOT NULL,
        prova_id INT NOT NULL,
        valor_nota DECIMAL(15, 2) NULL,
        PRIMARY KEY (aluno_id, prova_id),
        CONSTRAINT fk_aluno_has_prova_aluno1
            FOREIGN KEY (aluno_id)
            REFERENCES aluno (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
        CONSTRAINT fk_aluno_has_prova_prova1
            FOREIGN KEY (prova_id)
            REFERENCES prova (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
    );
END
GO

INSERT INTO aluno (id, nome, matricula, data_nascimento, data_matricula)
VALUES (1, 'Luke Lindo', '6781N', '1990-08-17', CURRENT_DATE());
GO

INSERT INTO prova (id, data_realizacao, descricao)
VALUES
    (1, '2019-02-28', 'Prova B1'),
    (2, '2019-07-27', 'Prova C1'),
    (3, '2019-08-26', 'Prova A2'),
    (4, '2019-03-19', 'Prova B2');
GO

INSERT INTO nota (aluno_id, prova_id, valor_nota)
VALUES
    (1, 1, 10),
    (1, 2, 9.8),
    (1, 3, 10);