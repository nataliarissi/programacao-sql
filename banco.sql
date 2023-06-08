--by Natalia Rissi
create database banco;

use banco;

create table cliente(
    id_cliente int primary key unique not null,
    cpf char(11) unique not null,
    rg char(10) unique not null,
    nome varchar(255) not null,
    idade int check(idade>=0 and idade<=100) not null,
    sexo char(1) check(sexo in('M', 'F')) not null,
    telefone char(8),
    endereco varchar(255) not null,
    estadocivil varchar(50) not null
);

create table agencia(
	numero_agencia int primary key unique not null,
	nome varchar(255) not null,
	endereco varchar(255) not null,
	gerente varchar(100) not null
);

create table conta(
    numero_agencia int not null,
	numero_conta int not null,
	id_cliente int not null,
    saldo float not null,
	primary key (numero_agencia, numero_conta),
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (numero_agencia) references agencia(numero_agencia)
);

create table movimentacao(
    id_movimn int primary key unique not null,
    numero_agencia_agencia int not null,
    numero_conta int not null,
    credito_debito char(1) check(credito_debito='C' or credito_debito='D') not null,
    tipo char(1) check(tipo='C' or tipo='P') not null,
    data_horario datetime not null,
    valor float not null,
	foreign key (numero_agencia, numero_conta) references conta(numero_agencia, numero_conta)
);
