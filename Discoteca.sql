create database DBDiscoteca;

use DBDiscoteca;

create table tab_cd (
    cod int(11) primary key not null,
    nome varchar(250) not null,
    datacompra date not null,
    valorpago float not null,
    localcompra varchar(100) not null,
    album boolean not null);
    
create table tab_musica (
    codcd int(11) not null,
    numero int(11) not null,
    nome varchar(250) not null,
    artista varchar(100) not null,
    tempo time not null,
    primary key (codcd, numero));
    
insert into tab_cd
	VALUES
    (1, 'Portals', 2020/01/01, 18.50, 'Amazon', true),
    (2, 'Portals', 2020/01/02, 20.00, 'Ponto Frio', true),
    (3, 'Portals', 2020/01/03, 17.01, 'MultiSom', false);
    
insert into tab_musica
	VALUES
    (1, 1, 'Death', 'Melanie Martinez', 2.21),
    (1, 2, 'Evil', 'Melanie Martinez', 7),
    (1, 3, 'Leeches', 'Melanie Martinez', 8);

