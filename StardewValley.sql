create database StardewValley;

use StardewValley;

create table alimentos(
	id_comida int AUTO_INCREMENT not null,
	nomes_comida varchar(255)not null,
	categoria_comida varchar(255) not null,
	preco_normal decimal (10,2) not null,
	preco_desconto decimal (10, 2) not null,
	primary key(id_comida)
);

CREATE TRIGGER tr_desconto BEFORE INSERT ON alimentos	
FOR EACH ROW
SET NEW.preco_desconto = (NEW.preco_normal * 0.90);


insert into alimentos (nomes_comida, categoria_comida, preco_normal)
values 
('Bolo de Chocolate', 'Doce', 25.00),
('Sashimi', 'Peixe', 40.00),
('Sopa de Tomate', 'Sopa', 2.50),
('Cenoura', 'Legume', 10.00),
('Pizza De Camarao', 'Pizza', 130.00),
('Cafe', 'Bebida', 7.50),
('Dollynho', 'Bebida', 12.00),
('Frango', 'Carne Branca', 66.00),
('Polvo', 'Molusco', 30.00),
('Torta de Limao', 'Doce', 50.00),
('Bolo de Cenoura', 'Doce', 15.00),
('Sorvete', 'Gelado', 22.00),
('Energetico de Maca Verde', 'Bebida', 66.00);