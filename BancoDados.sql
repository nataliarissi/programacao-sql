CREATE DATABASE Streaming;
use Streaming;
create table assinaturas(
                            id_assinatura int(11) auto_increment PRIMARY KEY,
                            id_usuario int (11) not null,
                            id_canal int (11) not null,
                            data_inicio date not null,
                            data_termino date not null,
                            valor_inscricao int not null,
                            saldo_bits int(11)not null);

CREATE TABLE pagamento(
                            id_pag int(11) PRIMARY KEY auto_increment,
                            id_usuario int (11) not null,
                            tipo_pagamento CHAR(1) CHECK (tipo_pagamento IN ('C', 'D')) NOT NULL,
                            bits int(11)not null,
                            inscricao int(11) unique not null,
                            valor int(11)not null);

create table usuarios(
                        id_usuário int(11) auto_increment PRIMARY KEY,
                        usuario_nome varchar(50) unique not null,
                        email varchar(255) unique not null,
                        senha varchar(50) not null,
                        PerfilImagemURL varchar(255),
                        descricacao text,
                        data_criacao datetime default current_timestamp);

create table carteira_bits(

                          id_carteira int(11) auto_increment primary key,
                          id_usuario int not null,
                          saldo int(11) not null);

create table canal(
                           id_canal int(11) auto_increment primary key,
                           id_usuario int(11) not null, 
                           Nome_canal varchar(255) not null, 
                           categoria varchar(50) not null, 
                           descricao varchar(255),
                           data_criacao datetime default current_timestamp,
                           id_seguidores int not null, 
                           programacao varchar(255) not null,
                           id_video int not null, 
						   clipes int(11)); 

create table comunidades(
                            id_comunidade int(11) auto_increment primary key,
                            id_canal int not null, 
                            nome_comunidade varchar(255),
                            descrição text,
                            id_seguidores int not null);

create table seguidores(
                        id_seguidores int (11) auto_increment primary key,
                        id_usuario int not null, 
                        id_canal int not null);	

create table transmissoes(
                    id_video int(11)not null primary key,
                    id_canal int (11)not null, 
                    titulo varchar(100) not null, 
					descricao text, 
                    duração int, 
                    data_hora datetime not null,
                    expectadores int);

create table comentarios(

                  id_comentario int(11) auto_increment primary key, 
                  id_usuario int not null, 
                  id_video int not null,
                  comentario text);

CREATE TABLE AD(

                id_ad int(11)auto_increment primary key,
                id_canal int not null,
                patrocinador varchar(255) not null,
                quantidade_ad int(11)not null,
                tempo_de_tela datetime not null);

                ALTER TABLE AD
              ADD CONSTRAINT fk_canal_ad FOREIGN KEY (id_canal) REFERENCES canal(id_canal);

    
              ALTER TABLE assinaturas
              FOREIGN KEY (id_usuario) REFERENCES usuario (PersonID)
              (id_usuario, id_canal,id_carteira);
              
              ALTER TABLE pagamento
             ADD CONSTRAINT fk_usuario_pagamento FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
			 
			  ALTER TABLE carteira_bits
			  ADD CONSTRAINT fk_usuario_carteira_bits FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);			 
			 
			ALTER TABLE canal
			ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

			ALTER TABLE canal
			ADD CONSTRAINT fk_seguidores FOREIGN KEY (id_seguidores) REFERENCES seguidores(id_seguidores);

			ALTER TABLE canal
			ADD CONSTRAINT fk_video FOREIGN KEY (id_video) REFERENCES transmissao(id_video);
			 
                        
			ALTER TABLE comunidades
			ADD CONSTRAINT fk_seguidores_comunidades FOREIGN KEY (id_seguidores) REFERENCES tabela_seguidores(id_seguidores);
 
		   ALTER TABLE seguidores
			ADD CONSTRAINT fk_usuario_seguidores FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
		
			ALTER TABLE seguidores
			ADD CONSTRAINT fk_canal_seguidores FOREIGN KEY (id_canal) REFERENCES canal(id_canal);             

			ALTER TABLE transmissoes
			ADD CONSTRAINT fk_canal_transmissoes FOREIGN KEY (id_canal) REFERENCES canal(id_canal);
	
            ALTER TABLE comentarios
             ADD CONSTRAINT fk_usuario_comentarios FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);
              
			ALTER TABLE comentarios
			ADD CONSTRAINT fk_video_comentarios FOREIGN KEY (id_video) REFERENCES transmissoes(id_video);
			 
Create View Trending as
select titulo as Video
from transmissoes where expectadores > 1000


CREATE TRIGGER trigger_desconto
AFTER INSERT ON assinaturas
FOR EACH ROW
BEGIN
    DECLARE novo_saldo_bits INT;
    SET novo_saldo_bits = NEW.saldo_bits - 2;
    
    UPDATE assinaturas
    SET saldo_bits = novo_saldo_bits
    WHERE id_assinatura = NEW.id_assinatura;

CREATE VIEW view_subquery_coluna AS
SELECT
    u.id_usuario,
    u.nome,
    (SELECT COUNT(*) FROM assinaturas a WHERE a.id_usuario = u.id_usuario) AS total_assinaturas
FROM
    usuario u;


CREATE VIEW view_subquery_filtro AS
SELECT
    u.id_usuario,
    u.usuario_nome
FROM
    usuario u
WHERE
    EXISTS (
        SELECT 1
        FROM assinaturas a
        WHERE a.id_usuario = u.id_usuario
        AND a.data_termino >= CURDATE()
    );
	
	CREATE DATABASE Streaming;
use Streaming;
create table assinaturas(
                            id_assinatura int(11) auto_increment PRIMARY KEY,
                            id_usuario int (11) not null,
                            id_canal int (11) not null,
                            data_inicio date not null,
                            data_termino date not null,
                            valor_inscricao int not null,
                            saldo_bits int(11) not null);

CREATE TABLE pagamento(
                            id_pag int(11) PRIMARY KEY auto_increment,
                            id_usuario int (11) not null,
                            tipo_pagamento CHAR(1) CHECK (tipo_pagamento IN ('C', 'D')) NOT NULL,
                            bits int(11)not null,
                            inscricao int(11) unique not null,
                            valor int(11)not null);

create table usuarios(
                        id_usuario int(11) auto_increment PRIMARY KEY,
                        usuario_nome varchar(50) unique not null,
                        email varchar(255) unique not null,
                        senha varchar(50) not null,
                        PerfilImagemURL varchar(255),
                        descricacao text,
                        data_criacao datetime default current_timestamp);

create table carteira_bits(

                          id_carteira int(11) auto_increment primary key,
                          id_usuario int not null,
                          saldo int(11) not null);

create table canal(
                           id_canal int(11) auto_increment primary key,
                           id_usuario int(11) not null, 
                           Nome_canal varchar(255) not null, 
                           categoria varchar(50) not null, 
                           descricao varchar(255),
                           data_criacao datetime default current_timestamp,
                           id_seguidores int not null, 
                           programacao varchar(255) not null,
                           id_video int not null, 
    					   clipes int(11)); 

create table comunidades(
                            id_comunidade int(11) auto_increment primary key,
                            id_canal int not null, 
                            nome_comunidade varchar(255),
                            descrição text,
                            id_seguidores int not null);

create table seguidores(
                        id_seguidores int (11) auto_increment primary key,
                        id_usuario int not null, 
                        id_canal int not null);	

create table transmissoes(
                    id_video int(11)not null primary key,
                    id_canal int (11)not null, 
                    titulo varchar(100) not null, 
					descricao text, 
                    duração int, 
                    data_hora datetime not null,
                    expectadores int);

create table comentarios(
                  id_comentario int(11) auto_increment primary key, 
                  id_usuario int not null, 
                  id_video int not null,
                  comentario text);

CREATE TABLE AD(
                id_ad int(11)auto_increment primary key,
                id_canal int not null,
                patrocinador varchar(255) not null,
                quantidade_ad int(11)not null,
                tempo_de_tela datetime not null);

                ALTER TABLE AD
              ADD CONSTRAINT fk_canal_ad FOREIGN KEY (id_canal) REFERENCES canal(id_canal);
    
              ALTER TABLE assinaturas
              add CONSTRAINT fk_usuario_assinaturas FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
              
              ALTER TABLE pagamento
             ADD CONSTRAINT fk_usuario_pagamento FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
			 
			  ALTER TABLE carteira_bits
			  ADD CONSTRAINT fk_usuario_carteira_bits FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);			 
			 
			ALTER TABLE canal
			ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

			ALTER TABLE canal
			ADD CONSTRAINT fk_seguidores FOREIGN KEY (id_seguidores) REFERENCES seguidores(id_seguidores);

			ALTER TABLE canal
			ADD CONSTRAINT fk_video FOREIGN KEY (id_video) REFERENCES transmissao(id_video);
                        
			ALTER TABLE comunidades
			ADD CONSTRAINT fk_seguidores_comunidades FOREIGN KEY (id_seguidores) REFERENCES tabela_seguidores(id_seguidores);
 
		   ALTER TABLE seguidores
			ADD CONSTRAINT fk_usuario_seguidores FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
		
			ALTER TABLE seguidores
			ADD CONSTRAINT fk_canal_seguidores FOREIGN KEY (id_canal) REFERENCES canal(id_canal);             

			ALTER TABLE transmissoes
			ADD CONSTRAINT fk_canal_transmissoes FOREIGN KEY (id_canal) REFERENCES canal(id_canal);
	
            ALTER TABLE comentarios
             ADD CONSTRAINT fk_usuario_comentarios FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);
              
			ALTER TABLE comentarios
			ADD CONSTRAINT fk_video_comentarios FOREIGN KEY (id_video) REFERENCES transmissoes(id_video);
			 
Create View Trending as
select titulo as Video
from transmissoes where expectadores > 1000;


CREATE TRIGGER trigger_desconto
AFTER INSERT ON assinaturas
FOR EACH ROW
BEGIN
    DECLARE novo_saldo_bits INT;
    SET novo_saldo_bits = NEW.saldo_bits - 2;
    
    UPDATE assinaturas
    SET saldo_bits = novo_saldo_bits
    WHERE id_assinatura = NEW.id_assinatura;



CREATE VIEW view_subquery_coluna AS
SELECT
    u.id_usuario,
    u.nome,
    (SELECT COUNT(*) FROM assinaturas a WHERE a.id_usuario = u.id_usuario) AS total_assinaturas
FROM
    usuario u;


CREATE VIEW view_subquery_filtro AS
SELECT
    u.id_usuario,
    u.usuario_nome
FROM
    usuario u
WHERE
    EXISTS (
        SELECT 1
        FROM assinaturas a
        WHERE a.id_usuario = u.id_usuario
        AND a.data_termino >= CURDATE()
    );