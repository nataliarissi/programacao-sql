create database BancoInvestimento
go
use BancoInvestimento
go
create table cultura(
	id int identity primary key,
	local_armazenamento varchar(100) not null
)
create table associado(
	id int identity primary key,
	nome varchar(255) not null,
	data_hora datetime not null default getdate()
)
go
create table quantidade(
	id int identity primary key,
	culturas int not null,
	data_hora datetime not null default getdate()
)
go
create table quantidade_itens(
	id int identity primary key,
	itens_investimento_id int not null,
	data_hora datetime not null default getdate()
)
go
create table fornecedor_investimento(
	id int identity primary key,
	nome varchar(255) not null,
	telefone char(11) not null,
	email varchar(150) not null
)
go
create table fornecedor_custeio(
	id int identity primary key,
	nome varchar(255) not null,
	telefone char(11) not null,
	email varchar(150) not null
)
go
create table itens_investimento(
	id int identity primary key,
	nome varchar(255) not null,
	marca varchar(255) not null,
	especificacao varchar(255) not null,
	quantidade int not null,
	valor numeric(10, 2) not null,
	fornecedor_id int not null,
	data_hora datetime not null default getdate(),

	foreign key(fornecedor_id) references fornecedor_investimento(id)
)
go
create table investimento(
	id int identity primary key,
	data_cadastro datetime not null default getdate(),
	status bit not null default 0,
	nome_assoc varchar(255) not null, 
	total_proposta numeric(10,2),
	proposta_financiada numeric(10,2),
	autorizacao_investimento varchar(255) not null,
	data_aprovada date not null,
	origem_proposta varchar(255) not null,
	informacoes_complmt varchar(255) not null,
	itens_id int not null,
	
	foreign key (id) references itens_investimento(id),
	foreign key(itens_id) references quantidade_itens(id)
)
go
create table custeio(
	id int identity primary key,
	data_hora datetime not null default getdate(),
	status bit not null default 0,
	associado_id int not null,
	valor_total numeric(10, 2) not null,
	valor_financiado numeric(10, 2) not null,
	autorizacao_chefe bit not null default 0,
	data_aprovacao date not null,
	origem varchar(255) not null,
	informacoes_complmt varchar(255) not null,
	finalidade_custo varchar(255),
	itens_id int not null,
	quantidade_id int not null,
	
	foreign key (itens_id) references itens_investimento(id),
	foreign key (quantidade_id) references quantidade(id)
)
go
create table itens_custeio(
	id int identity primary key,
	data_hora datetime not null default getdate(),
	status bit not null default 0,
	associado_id int not null,
	valor_total numeric(10, 2) not null,
	valor_financiado numeric(10, 2) not null,
	autorizacao_fornecedor int not null,
	data_aprovacao date not null,
	origem varchar(255) not null,
	informacoes_complmt varchar(255) not null,
	finalidade_custo varchar(255),
	itens_id int not null,
	quantidade_id int not null,
	
	foreign key (autorizacao_fornecedor) references fornecedor_custeio(id),
	foreign key (itens_id) references itens_investimento(id),
	foreign key (quantidade_id) references quantidade_itens(id)	
)
create table usuario(
	id int identity primary key,
	nome varchar(255) not null,
	idade int not null,
	email varchar(100) not null,
	celular char(11) not null,
	data_hora datetime not null default getdate(),
	associado_id int,

	foreign key (associado_id) references associado(id)
)