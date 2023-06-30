create database steam;
use steam;
create table games(
	id_jogos int AUTO_INCREMENT not null,
	nomes_jogos varchar(255)not null,
	tipo_jogo varchar(255) not null,
	preco_normal decimal (10,2) not null,
	preco_desconto decimal (10, 2) not null,
	primary key(id_jogos)
);

CREATE TRIGGER tr_desconto BEFORE INSERT ON games	
FOR EACH ROW
SET NEW.preco_desconto = (NEW.preco_normal * 0.90);


insert into games (nomes_jogos, tipo_jogo, preco_normal)
values 
('Stardew Valley', 'fazenda', 25.00),
('Cult Of The Lamb', 'cultismo', 66.00),
('Project Zomdoid', 'zombie', 120.00);
