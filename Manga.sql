create database baseDados;
go
use baseDados;
go
create table criadorManga (
    id int identity(1,1) primary key,
    nome varchar(255) not null,
    dataNascimento date,
    localOrigem varchar(100),
    descricao varchar(200),
    sexo char(1) not null check (sexo in ('M', 'F')) 
);
go
create table cliente (
    id int identity(1,1) primary key,
    nome varchar(255) not null,
    email varchar(255) unique not null,
    dataNascimento date,
    sexo char(1) not null check (sexo in ('M', 'F')),
    endereco varchar(255)
);
go
create table mangaOnline (
    id int identity(1,1) primary key,
    perfilImagemURL varchar(255) not null,
    titulo varchar(100) not null,
    autorId int not null,
    clienteId int not null,
    anoPublicacao int not null,
    genero varchar(100) not null,
    sinopse varchar(255) not null,
    editora varchar(100) not null,
    faixaEtaria char(2) not null,
    preco_normal decimal(10, 2) not null,
    preco_desconto decimal(10, 2) not null,
    foreign key (autorId) references criadorManga(id),
    foreign key (clienteId) references cliente(id)
);
go
create table pagamentos (
    id int identity(1,1) primary key,
    cliente_id int not null,
    manga_id int not null,
    valor decimal(10, 2) not null,
    formaPagamento char(1) not null check (formaPagamento in ('D', 'C')),
    data date not null,
    status char(1) not null check (status in ('S', 'P', 'C')),
    foreign key (manga_id) references mangaOnline(id),
    foreign key (cliente_id) references cliente(id)
);
go
create trigger tr_desconto on mangaOnline
before insert
as
begin
    set nocount on;
    declare @preco_normal decimal(10, 2);
    declare @preco_desconto decimal(10, 2);
    
    select @preco_normal = i.preco_normal from inserted i;
    set @preco_desconto = @preco_normal * 0.90;
    
    update mangaOnline
    set preco_desconto = @preco_desconto
    from inserted
    where mangaOnline.id = inserted.id;
end;
go
create view manga as
select id, titulo, sinopse
from mangaOnline;
