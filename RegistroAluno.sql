create database prova;
go
use prova;
go
create table estudante (
    ra int identity(1, 1) primary key not null,
    nome varchar(255) not null,
    telefone char(10) not null,
    endereco varchar(255) not null,
    nome_pai varchar(255),
    nome_mae varchar(255) not null
);
go
create table materia (
    codigo int identity(1, 1) primary key,
    nome varchar(255) not null,
    carga_horaria time not null,
    media_notas decimal(10, 2) not null
);
go
create table registro_academico (
    ra_aluno int not null,
    codigo_disciplina int not null,
    data_matricula date not null,
    foreign key (ra_aluno) references estudante(ra),
    foreign key (codigo_disciplina) references materia(codigo)
);
go
create table notas_prova (
    id int identity(1, 1) primary key not null,
    codigo_materia int not null,
    nota decimal(5, 2) not null,
    foreign key (codigo_materia) references materia(codigo)
);
go
create trigger after_insert_nota_prova
on notas_prova
after insert
as
begin
    declare @total_notas decimal(5, 2);
    declare @quantidade_notas int;

    select @total_notas = sum(nota), @quantidade_notas = count(*)
    from notas_prova
    where codigo_materia = (select codigo_materia from inserted);

    if @quantidade_notas > 0
        set @total_notas = @total_notas / @quantidade_notas;
    else
        set @total_notas = 0;

    update materia
    set media_notas = @total_notas
    where codigo = (select codigo_materia from inserted);
end;
go
insert into estudante (nome, telefone, endereco, nome_pai, nome_mae)
values
    ('Luke Rissi', '5030870011', 'Rua dos amores, 401', 'John Mathias', 'Sophia Oliveira'),
    ('Oliver Samurai', '5033338945', 'Vila do Terror, 201', 'Pedro Motim', 'Kate Aires'),
    ('João Felipe', '5031207456', 'Rua do abacate, 66', 'Leonardo Ramos', 'Maria da Luz');
go
insert into materia (nome, carga_horaria, media_notas)
values
    ('ADS', '10:10', 6.0),
    ('Redes', '17:50', 6.0),
    ('Embarcados', '14:30', 6.0);
go
insert into registro_academico (ra_aluno, codigo_disciplina, data_matricula)
values
    (1, 1, '2020-08-18'),
    (2, 2, '2020-08-21'),
    (3, 3, '2020-08-22');
go
insert into notas_prova (codigo_materia, nota)
values
    (1, 8),
    (2, 6),
    (3, 9);

create view aluno as
select ra, nome, endereco
from estudante;
