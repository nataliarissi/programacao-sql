--criado BancoProduto
--auto_increment = identity
--double = numeric(10,2)

create table estados(
	id int identity not null,
	nome_estado varchar(255) not null,
	pais_id int not null,
	primary key (id)
	);

create table paises(
	id int identity not null,
	nome_pais varchar(255) not null,
	primary key(id),
	foreign key (id) references paises(id)
	);

create table cidades(
	id int identity not null,
	nome_cidade varchar(255) not null,
	estado_id int not null,
	pais_id int not null,
	primary key(id),
	foreign key (estado_id) references estados(id),
	foreign key (pais_id) references paises(id)
	);

create table enderecos(
	id int identity not null,
	cep char(8) unique not null,
	tipo_logradouro char(1) not null,
	endereco varchar(255) not null,
	bairro varchar(100) not null,
	complemento varchar(255),
	pais_id int not null,
	estado_id int not null,
	cidade_id int not null
	primary key(id, cep),
	foreign key (pais_id ) references paises(id),
	foreign key (estado_id) references estados(id),
	foreign key (cidade_id) references cidades(id)
	);

create table categorias(
	id int identity not null,
	descricao varchar(255) not null,
	status char(1) check(status in('S', 'N')) not null,
	primary key(id)
	);

create table clientes(
	id int identity not null,
	razao_social varchar(255) not null,
	nome_fantasia varchar(100) not null,
	tipo_pessoa char(1) check(tipo_pessoa in('F', 'J')) not null,
	cpf char(11) unique not null,
	cnpj char(14) unique not null,
	categoria_id int not null,
	email varchar(255) unique not null,
	status char(1) check(status in('S', 'N')) not null,
	data_criacao datetime not null,
	ultima_alteracao datetime not null,
	primary key(id),
	foreign key (categoria_id) references categorias(id)
	);

create table fornecedores(
	id int identity not null,
	razao_social varchar(255) not null,
	nome_fantasia varchar(255) not null,
	endereco_id int not null,
	endereco_cep char(8) not null,
	status char(1) check(status in('S', 'N')) not null,
	data_criacao datetime not null,
	ultima_alteracao datetime not null,
	primary key(id),
	foreign key (endereco_id, endereco_cep) references enderecos(id, cep)	
);

create table vendedores(
	id int identity not null,
	nome varchar(255) not null,
	cpf char (11) unique not null,
	comissao float not null,
	gerente_id int not null,
	data_criacao datetime not null,
	ultima_alteracao datetime not null,
	primary key(id),
	foreign key (gerente_id) references vendedores(id)
	);

create table tipo_produtos(
	id int identity not null,
	descricao varchar(255) not null,
	primary key(id)
	);

create table produtos(
	id int identity not null,
	descricao varchar(255) not null,
	tipo_produto_id int not null,
	observacao text,
	data_criacao datetime not null,
	ultima_alteracao datetime not null,
	primary key(id),
	foreign key (tipo_produto_id) references tipo_produtos(id)
	);

create table produtos_fornecedores(
	id int identity not null,
	fornecedor int not null,
	produto_id int not null,
	valor numeric(10,2) not null,
	data_vigente datetime not null,
	primary key(id),
	foreign key (produto_id) references fornecedores(id)
	);

create table orcamentos(
	id int identity not null,
	cliente_id int not null,
	vendedor_id int not null,
	valor_orcamento numeric(10,2) not null,
	valor_desconto numeric(10,2) not null,
	status char(1) check(status in('S', 'N')) not null,
	primary key(id),
	foreign key (cliente_id) references clientes(id),
	foreign key (vendedor_id) references vendedores(id)
	);

create table itens_orcamentos(
	id int identity not null,
	orcamento_id int not null,
	fornecedor_id int not null,
	quantidade int not null,
	valor_unitario numeric(10,2) not null,
	desconto numeric(10,2) not null
	primary key(id),
	foreign key (orcamento_id) references orcamentos(id),
	foreign key (fornecedor_id) references fornecedores(id)
	);

create table vendas(
	id int identity not null,
	orcamento_id int not null,
	cliente_id int not null,
	vendendor_id int not null,
	valor_venda int not null,
	desconto numeric(10,2) not null,
	status_entrega char(1) check(status_entrega in('S', 'N')) not null,
	data_pagamento datetime not null,
	data_entrega datetime not null,
	data_criacao datetime not null,
	data_alteracao datetime not null,
	ultima_alteracao datetime not null,
	primary key(id),
	foreign key (orcamento_id) references orcamentos(id),
	foreign key (cliente_id) references clientes(id),
	foreign key (vendendor_id) references vendedores(id)
	);

create table comissoes(
	id int identity not null,
	venda_id int not null,
	vendedor_id int not null,
	valor_comissao numeric(10,2) not null,
	data_pagamento date not null,
	status char(1) check(status in('S', 'N')) not null,
	data_criacao datetime not null,
	data_alteracao datetime not null,
	primary key(id),
	foreign key (venda_id) references vendas(id),
	foreign key (vendedor_id) references vendedores(id)
	);