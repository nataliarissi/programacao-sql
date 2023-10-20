create database FinanciamentoFazenda
go
use FinanciamentoFazenda
go
create table cultura(
	id int identity primary key,
	local_armazenamento varchar(100) not null,
 data_hora datetime not null default getdate()
)
go
create table associado(	
	id int identity primary key,
	usuario bit not null default 0
)
go
create table usuario(
	id int identity primary key,
	nome varchar(255) not null,
	idade int not null,
	email varchar(100) not null,
	celular char(11) not null,
 data_hora datetime not null default getdate()
	foreign key (id) references associado(id)
)
go
create table proposta(
	id int identity primary key,
	data_cadastro date not null,
	status char(1) check(status in('E', 'F', 'A')),
--em andamento E / finalizado F / analise A
	usuario_id int not null,
	valor_total_proposta money not null,
	valor_financiado money not null,
	itens_financiados int not null,
 data_hora datetime not null default getdate()
	foreign key (usuario_id) references usuario(id)
)
go
create table investimento(
	id int identity primary key,
	usuario_id int not null,
	data_aprovacao date not null,
	origem varchar(100) not null,
	feira bit not null default 0,
	info_complementares varchar(255),
	proposta_id int not null,
 data_hora datetime not null default getdate()
	foreign key (proposta_id) references proposta(id)
)
go
create table custeio(
	id int identity primary key,
	finalidade bit not null default 0,
--agricola 0 / pecuaria 1
 data_hora datetime not null default getdate()
	foreign key (id) references cultura(id)
)
go
create table item_investimento(
	id int identity primary key,
	proposta_id int not null,
	nome_produto varchar(150) not null,
	quantidade_produto int not null,
	tipo_perecivel bit not null default 0,
	descricao varchar(255),
 data_hora datetime not null default getdate()
	foreign key (proposta_id) references proposta(id)
)