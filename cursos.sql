Considere as seguintes tabelas:

Curso (Codigo (PK), Nome, NumeroVagas)
Instrutor (Codigo (PK), Nome, Apelido, Fone, Celular)
Horario (Codigo (PK), Sala, Hora)
Ministrado (DataCurso (PK), CodigoHorario (FK), CodigoCurso (FK), CodigoInstrutor (FK))

Através de comandos SQL, faça:

Mostre todas as tabelas do seu BD;
Insira pelo menos 5 (cinco) registros em cada tabela;
Adicione o campo Autorizado char(1) na tabela cursos;
Mostre o nome de todos os instrutores;
Mostre todos os campos da tabela horário;
Mostre o nome do curso.

create database cursos;

use cursos;

create table Curso(
 Cod int(11) not null,
 Nome varchar(255) not null,
 Numero_vagas int(11) not null,
 Autorizado char(1) not null,
 PRIMARY KEY (Cod)
);

create table Instrutor(
 Cod_inst int(11) not null,
 Nome varchar(255) not null,
 Apelido varchar(255) not null,
 Fone int(11),
 Celular int(11),
 PRIMARY KEY (Cod_inst)
);

create table Ministrado_Horario(
 Cod_minist int(11) not null,
 Data_curso datetime not null,
 Sala varchar(255) not null,
 Cod_curso int(11) not null,
 Cod_inst int(11) not null,
 PRIMARY key (Cod_minist),
 FOREIGN key (Cod_curso) REFERENCES Curso(Cod),
 FOREIGN key (Cod_inst) REFERENCES Instrutor(Cod_inst)
);

INSERT into curso(Cod, Nome, Numero_vagas, Autorizado)
VALUES
 (1, 'Analise e Desenvolvimento de Sistemas', '50', 'N'),
 (2, 'Sistemas Embarcados', '80', 'M'),
 (3, 'Automacao Industrial', '70', 'L'),
 (4, 'Redes de Computadores', '60', 'I'),
 (5, 'Sistemas de Telecomunicacoes', '50', 'T');

INSERT into instrutor(Cod_inst, Nome, Apelido, Fone, Celular)
VALUES
 (1, 'Natália', 'Nati', '30217871', '998710066'),
 (2, 'Marcus', 'Mark', '32278985', '998621178'),
 (3, 'Luke', 'Luk', '30216989', '996123101'),
 (4, 'Sophia', 'Soph', '37986256', '99901649'),
 (5, 'Leonardo', 'Leo', '33310121', '998358621');

INSERT into ministrado_horario(Cod_minist, Data_curso, Sala, Cod_curso, Cod_inst)
VALUES
 (1, '2023/06/07 13:30', '107', '2', '4'),
 (2, '2023/06/08 14:20', '202', '1', '3'),
 (3, '2023/06/09 13:30', '201', '5', '1'),
 (4, '2023/06/04 15:30', '101', '4', '5'),
 (5, '2023/06/07 14:20', '102', '3', '2');