Em uma Faculdade, estudantes matriculam-se em disciplinas!
O banco de dados para este processo de negócio deve fornecer as seguintes
informações:
 Para cada ALUNO, RA, nome, endereço, telefone.
 Para cada DISCIPLINA, código, nome e carga horária da disciplina
 Para cada MATRICULA, RA do aluno, código da disciplina e data da matricula
 Cada aluno deve se matricular em pelo menos uma disciplina e no máximo em
3 disciplinas

create database faculdade;

use faculdade;

create table aluno(
    RA int(11) not null,
    nome varchar(255) not null,
    endereco varchar(255) not null,
    telefone char(8),
    PRIMARY key (RA)
);

create table disciplina(
    cod int(11) not null,
    nome varchar(255) not null,
    carga_horariaDisc int(11) not null,
    PRIMARY key (cod)
);

create table matricula(
    ra_aluno int not null,
    cod_disc int not null,
    data_matric date not null,
    primary key (ra_aluno, cod_disc),
    foreign key (ra_aluno) references aluno (RA),
    foreign key (cod_disc) references disciplina (cod)
);
   