/* Criar uma base de Dados
	create database dbagenda;
    use dbagenda;
Excluir um banco de dados 
	drop database dbagenda;
*/

create table contatos(
	idcon int PRIMARY key AUTO_INCREMENT,
    nome varchar(250) not null,
    fone char(8) not null,
    email varchar(250)
);

/* Descrever a estrutura da tabela*/
describe contatos;

/*O comando abaixo altera o nome de um campo da tabela*/
alter table contatos change nome contato 
varchar(50) not null;

describe contatos

/*Comando abaixo adiciona um novo campo a tabela*/
alter table contatos add column obs varchar(200) ;

describe contatos

/* O comando abaixo adiciona um novo campo a tabela em um lugar especifico */
alter table contatos add column fone2 char(8) after fone;

describe contatos

/*O comando abaixo altera o tipo de dados ou parametros de um campo - atributo!*/
alter table contatos MODIFY COLUMN fone2 char(9);

describe contatos

/*O comando abaixo exclui um campo tabela*/
alter table contatos drop COLUMN obs;

DESCRIBE contatos

/*Excluir a tabela contatos*/
drop table contatos 

create table contatos(
	idcon int PRIMARY key AUTO_INCREMENT,
    nome varchar(250) not null,
    fone char(8) not null,
    email varchar(250)
);

/*crud (CREATE READ UPDATE DELETE)
inserindo registros (dados) na tabela contatos 
*/
insert into contatos(nome, fone, email)
	values('Luke Lindo', '96666-6666', 'itachi@email.com');

insert into contatos (nome, fone, email)
	values('Natália Nmomozono', '98888-8888', 'nat@email.com');

insert into contatos(nome, fone, email)
	values('Linux', '99999-9999', 'tux@email.com');

insert into contatos(nome, fone)
	values('Nanami', '11110-0000');
    
insert into contatos(nome, fone, email)
	values('Tomoe', '77777-7777', 'yok@email.com');

insert into contatos(nome, fone, email)
	values('Ana Laura', '98747-1100', 'ana@email.com');

show TABLES

DESCRIBE contatos

show tables

/*Selecionando todos os registros da tabela*/
SELECT *from contatos

/*Selecionando registros de acordo com um criterio*/
select * from contatos where idcon=1

SELECT 	* from contatos where nome='Nanami';
comando para puxar alguem

SELECT * from contatos where nome like'N%';
=puxar pelas letras

/*Selecionar por ordem alfabetica (asc ou desc)*/
SELECT * from contatos order by nome asc;

SELECT * from contatos order by nome desc;

/*Selecionar campos especificos da tabela*/
SELECT nome, fone from contatos

/*Criando 'apelidos' para os campos da tabela*/
SELECT nome as Contato, fone as Telefone, email as 'E-mail' from contatos;

/*CRUD UPDATE --alterando registros (dados) na tela*/
UPDATE contatos set email ='momozono@email.com' where idcon='2';

UPDATE contatos set email='luknat@email.com' where idcon=5;
colocar - altera de todos

UPDATE contatos set nome='Linuxx', fone='99999-7777', email='lix@email.com' where idcon=3;

/* Removendo um registro da tabela*/
delete from contatos where idcon=6;



