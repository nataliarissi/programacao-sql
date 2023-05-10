Fazer os comandos em sql dos seguintes bancos de dados:

Navio: um navio tem um nome, um código de registro, uma capacidade de transporte e um
ano de construção.

Carro: um carro tem um fabricante, um nome de série e um modelo (exemplo:
Honda Accord DX, no qual Honda é o fabricante, Accord é o nome de série e DX é o
modelo). Um carro também possui um código de identificação do veículo, a placa e a cor.

Restaurante: um restaurante tem um endereço, uma capacidade, um número de telefone e
um estilo de comida (por exemplo: francesa, russa, chinesa).

create database banco_navio;

use banco_navio;

create table navio(
 Cod_regist int(11),
 Nome varchar(255) not null,
 Capac_transp int(11) not null,
 Ano_const char(4)
);

ALTER table navio add primary KEY (Cod_regist);

INSERT into navio(Cod_regist, Nome, Capac_transp, Ano_const)
VALUES
 (1, 'Fluyt', '100', '1878'),
 (2, 'Belonave', '190', '1932'),
 (3, 'Fragata', '156', '1892'),
 (4, 'Brigue', '136', '1900'),
 (5, 'Escuna', '90', '1921');

create database banco_carro;

use banco_carro;

create table carro(
 Cod_ident int(11),
 Fabricante varchar(255) not null,
 Nome_serie varchar(255) not null,
 Modelo varchar(255) not null,
 Placa varchar(8),
 Cor varchar(255) not null
);

alter table carro add PRIMARY key (Cod_ident);

INSERT into carro(Cod_ident, Fabricante, Nome_serie, Modelo, Placa, Cor)
VALUES
 (1, 'Accord', 'Honda', 'DX', 'ALK-2108', 'Preto'),
 (2, '320i GP', 'BMW', 'BMW Serie 3', 'RST-6691', 'Branco'),
 (3, 'Feel Pack 1.6 AT', 'Citroen', 'Citroen C 3', 'NAK-8872', 'Vermelho'),
 (4, 'Spin Activ', 'Chevrolet', 'Spin', 'YOT-6101', 'Cinza'),
 (5, 'Mercedes_Benz Group', 'Mercedes', 'Glee', 'NMA-0127', 'Prata');

create database banco_restaurante;

use banco_restaurante;

create table restaurante(
 Cod int(11),
 Endereco varchar(255) not null,
 Capacidade int(11),
 Numero_cel int(11),
 Estilo_comida varchar(255) not null
);

ALTER table restaurante add primary key (Cod);

INSERT into restaurante(Cod, Endereco, Capacidade, Numero_cel, Estilo_comida)
VALUES
 (1, 'Rua Benjamim Flores, 10', '50', '997650112', 'chinesa'),
 (2, 'Rua Baltazar, 537', '130', '991026478', 'japonesa'),
 (3, 'Rua Nova Vila, 711', '200', '998627784', 'russa'),
 (4, 'Rua Porto Velho, 210', '80', '996018807', 'francesa'),
 (5, 'Rua Mar Negro, 61', '120', '998780118', 'italiana');
