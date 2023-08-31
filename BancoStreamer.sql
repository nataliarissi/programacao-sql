-- Criando BancoStreamer
CREATE DATABASE BancoStreamer;
USE BancoStreamer;

CREATE TABLE streamers (
    id INT IDENTITY NOT NULL,
    nick VARCHAR(100) NOT NULL,
    nomeCanal VARCHAR(100) NOT NULL,
    games VARCHAR(255) NOT NULL,
    quantidadeVideos INT NOT NULL,
    quantidadeSubs INT NOT NULL,
    horaInicio DATETIME DEFAULT NULL,
    horaConclusao DATETIME DEFAULT NULL,
    tempoFeitoNoDia DATETIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE canal (
    id INT IDENTITY NOT NULL,
    id_streamer INT NOT NULL,
    id_espectador INT NOT NULL
);

CREATE TABLE espectadores (
    id INT IDENTITY NOT NULL,
    nickConta VARCHAR(100) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    dataNascimento DATE NOT NULL,
    premium CHAR(1) CHECK (premium IN ('S', 'N')) NOT NULL
);

CREATE TABLE categorias (
    id INT IDENTITY NOT NULL,
    id_canal INT NOT NULL,
    assunto VARCHAR(100) NOT NULL
);

CREATE TABLE planos (
    id INT IDENTITY NOT NULL,
    canal INT NOT NULL,
    preco_normal DECIMAL(10, 2) NOT NULL,
    preco_desconto DECIMAL(10, 2) NOT NULL,
    meiosPagamento CHAR(1) CHECK (meiosPagamento IN ('C', 'D')) NOT NULL
);

CREATE VIEW StreamersWithViewerCount AS
SELECT
    s.id,
    s.nick,
    s.nomeCanal,
    s.games,
    s.quantidadeVideos,
    s.quantidadeSubs,
    s.horaInicio,
    s.horaConclusao,
    s.tempoFeitoNoDia,
    COUNT(c.id_espectador) AS quantidadeEspectadores
FROM
    streamers s
LEFT JOIN
    canal c ON s.id = c.id_streamer
GROUP BY
    s.id,
    s.nick,
    s.nomeCanal,
    s.games,
    s.quantidadeVideos,
    s.quantidadeSubs,
    s.horaInicio,
    s.horaConclusao,
    s.tempoFeitoNoDia;

CREATE TRIGGER tr_desconto
ON planos
AFTER INSERT
AS
BEGIN
    UPDATE planos
    SET preco_desconto = i.preco_normal * 0.90
    FROM inserted AS i
    WHERE planos.id = i.id;
END;
