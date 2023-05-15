--SCRIPT DA DELEGACIA
CREATE database Delegacia;

use Delegacia;

--CRIANDO ARMA
CREATE table Arma (id_arma int(11) not null,
    			   numero_arma int(11) not null, 
                   descricao_arma varchar(255) not null, 
                   PRIMARY key (id_arma)
                  );
                       
insert into Arma (id_arma, numero_arma, descricao_arma)
	values 
    (1, 1, 'revolver'),
    (2, 2, 'pistola'),
    (3, 3, 'faca'),
    (4, 4, 'revolver'),
    (5, 5, 'faca');

--CRIANDO CRIME
CREATE table Crime (id_crime int(11) not null,
    			numero_bo int(11) not null, 
                descricao_crime varchar(255) not null, 
                local_crime varchar(255) not null,
                data_crime datetime not null,
                visto_chefe char(1) not null,
                PRIMARY key (id_crime)
                );
                       
insert into Crime (id_crime, numero_bo, descricao_crime, local_crime, data_crime, visto_chefe)
values
(1, 1, 'Assassino apunhalou pelas costas e o matou', 'restaurante', '2023_02_20 11:10', 's'),
(2, 2, 'Divida pendente', 'casa da vitima', '2023_02_07 19:30', 'n'),
(3, 3, 'Envolvimento de uma briga', 'trabalho da vitima', '2023_02_10 21:00', 'n'),
(4, 4, 'Problemas com aposta', 'casa da vitima', '2023_02_11 09:50', 's'),
(5, 5, 'Divida pendente', 'trabalho da vitima', '2023_02_08 14:40', 's');

--CRIANDO EVIDENCIA
create table Evidencia (
	id_crime int(11) not null,
	id_arma int(11) not null,
	primary key (id_crime, id_arma),
	foreign key (id_crime) references Crime(id_crime),
	foreign key (id_arma) references Arma(id_arma)
	);

insert into Evidencia(id_arma, id_crime)
	values
	(1, 1),
    (2, 3),
    (5, 4),
    (4, 2),
    (3, 5);

--CRIANDO CRIMINOSO
CREATE table Criminoso (id_criminoso int(11) not null,
    					rg_criminoso char(10) not null, 
                        nome_criminoso varchar(255) not null, 
                        endereco_criminoso varchar(255) not null,
                        PRIMARY key (id_criminoso)
                        );
                        
insert into Criminoso (id_criminoso, rg_criminoso, nome_criminoso, endereco_criminoso)
	values 
    (1, '8795001645', 'Luke Lindo', 'Rua da Morte, 701'),
    (2, '1278966410', 'Itachi Uchiha', 'Rua Assis Brasil, 310'),
    (3, '2287499102', 'Bruno Tavares', 'Rua Anjos dos sinos, 101'),
    (4, '1178066771', 'Theo Leonardo', 'Rua Vilarejo Feliz, 402'),
    (5, '2078899710', 'Jeff James', 'Rua Amor doce, 202');

--CRIANDO HISTORICO CRIMINAL
create table Historico_Criminal(
	id_criminoso int(11) not null,
	id_crime int(11) not null,
	primary key (id_criminoso, id_crime),
	foreign key (id_criminoso) references Criminoso(id_criminoso),
	foreign key (id_crime) references Crime(id_crime)
);

insert into Historico_Criminal(id_criminoso, id_crime)
	values
	(4, 1),
    (2, 5),
    (1, 4),
    (3, 2),
    (5, 3);

--CRIANDO VÍTIMA
CREATE table Vitima (id_vitima int(11) not null,
    				rg_vitima char(10) not null, 
                    nome_vitima varchar(255) not null, 
                    endereco_vitima varchar(255) not null,
                    PRIMARY key (id_vitima)
                    );
                        
insert into Vitima (id_vitima, rg_vitima, nome_vitima, endereco_vitima)
	values
    (1, '2207899210', 'Lucca Pereira', 'Rua Porto Seguro, 706'),
    (2, '7881072654', 'Sophia Almeida', 'Rua das Flores, 305'),
    (3, '8976120466', 'Nayla Silva', 'Rua Santo Alegre, 801'),
    (4, '3244987021', 'Tomoe Susui', 'Rua das Pedras Claras, 401'),
    (5, '4651038862', 'Nanami Momozono', 'Rua das vozes, 207');
   
--CRIANDO OCORRENCIA
create table Ocorrencia(
	id_vitima int(11) not null,
	id_crime int(11) not null,
	primary key (id_vitima, id_crime),
	foreign key (id_vitima) references Vitima(id_vitima),
	foreign key (id_crime) references Crime(id_crime)
);

insert into Ocorrencia(id_vitima, id_crime)
	values
	(2, 4),
    (1, 5),
    (4, 3),
    (3, 2),
    (5, 1);

--Criminoso = rg_criminoso, nome_criminoso, endereco_criminoso
--Vitima = rg_vitima, nome_vitima, endereco_vitima
--Crime = numero_bo, descricao_crime, local_crime, data_crime, visto_chefe
--Arma = numero_arma, descricao_arma