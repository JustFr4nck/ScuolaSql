
-- ___CREATE DATABASE___
drop schema if exists cinema_perrotta;
create schema cinema_perrotta;
use cinema_perrotta;

-- ___CREATE TABLE___
create table Sale(
	id_sala int(11) primary key auto_increment,
    nome_sala varchar(20) not null,
    posti int(11) not null
);

create table film(
	id_film int(11) primary key auto_increment,
    titolo varchar(50) not null,
    genere varchar(20) not null
);

create table Spettacoli(
	id_spettacolo int(11) primary key auto_increment,
	data_ora datetime not null,
    id_film int(11) not null,
    id_sala int(11) not null,
    foreign key (id_film) references Film(id_film),
    foreign key (id_sala) references Sale(id_sala)
);

create table Biglietti(
	id_biglietto int(11) primary key auto_increment,
    id_spettacolo int(11) not null,
    prezzo decimal(5,2) not null,
    foreign key (id_spettacolo) references Spettacoli(id_spettacolo)
);


-- ___INSERT DATA___
INSERT INTO Film (id_film, titolo, genere)
VALUES
(1, 'Spider-Man', 'Azione'),
(2, 'Avengers', 'Azione'),
(3, 'Matrix', 'Fantascienza'),
(4, 'Inception', 'Fantascienza'),
(5, 'Toy Story', 'Animazione');

INSERT INTO Sale (id_sala, nome_sala, posti)
VALUES
(1, 'Sala 1', 100),
(2, 'Sala 2', 150),
(3, 'Sala 3', 120),
(4, 'Sala 4', 80);

INSERT INTO Spettacoli (id_spettacolo, id_film, id_sala, data_ora)
VALUES
(1, 1, 1, '2026-01-17 18:00'),
(2, 1, 1, '2026-01-18 20:00'),
(3, 2, 2, '2026-01-17 20:30'),
(4, 2, 2, '2026-01-18 18:30'),
(5, 2, 2, '2026-01-19 21:00'),
(6, 3, 3, '2026-01-18 19:00'),
(7, 4, 3, '2026-01-19 17:00'),
(8, 1, 4, '2026-01-19 20:00');

INSERT INTO Biglietti (id_biglietto, id_spettacolo, prezzo)
VALUES
(1, 1, 10),
(2, 1, 10),
(3, 2, 12),
(4, 8, 15),
(5, 3, 15),
(6, 3, 15),
(7, 4, 15),
(8, 5, 20),
(9, 7, 18),
(10, 3, 15),(11, 3, 15),(12, 3, 15),(13, 3, 15),(14, 3, 15),
(15, 3, 15),(16, 3, 15),(17, 3, 15),(18, 3, 15),(19, 3, 15),
(20, 3, 15),(21, 3, 15),(22, 3, 15),(23, 3, 15),(24, 3, 15),
(25, 3, 15),(26, 3, 15),(27, 3, 15),(28, 3, 15),(29, 3, 15),
(30, 3, 15),(31, 3, 15),(32, 3, 15),(33, 3, 15),(34, 3, 15),
(35, 3, 15),(36, 3, 15),(37, 3, 15),(38, 3, 15),(39, 3, 15),
(40, 3, 15),(41, 3, 15),(42, 3, 15),(43, 3, 15),(44, 3, 15),
(45, 3, 15),(46, 3, 15),(47, 3, 15),(48, 3, 15),(49, 3, 15),
(50, 3, 15),(51, 3, 15),(52, 3, 15),(53, 3, 15),(54, 3, 15),
(55, 3, 15),(56, 3, 15),(57, 3, 15),(58, 3, 15),(59, 3, 15);


-- ___QUERY___

-- 1. Trovare il numero di biglietti venduti per ogni sala.
select s.id_sala, count(b.id_biglietto) n_biglietti
from spettacoli sp
join sale s on sp.id_sala = S.id_sala
join biglietti b on b.id_spettacolo = sp.id_spettacolo
group by s.id_sala;

-- 2. Visualizzare l’elenco degli spettacoli con data, film e numero di posti della sala
select sp.id_spettacolo, sp.data_ora, f.titolo, s.posti
from spettacoli sp
join sale s on sp.id_sala = s.id_sala
join film f on sp.id_film = f.id_film;

-- 3. Trovare il totale dell’incasso per ogni genere di film
select f.genere, sum(b.prezzo) tot_incassi
from spettacoli sp
join film f on sp.id_film = f.id_film
join biglietti b on b.id_spettacolo = sp.id_spettacolo
group by f.genere;

-- 4. Trovare le sale con più di 30 biglietti venduti
select s.id_sala, s.nome_sala
from spettacoli sp
join sale s on sp.id_sala = S.id_sala
join biglietti b on b.id_spettacolo = sp.id_spettacolo
group by s.id_sala, s.nome_sala
having count(id_biglietto) > 30;

-- 5. Visualizzare i biglietti venduti dopo il 18/01/2026 con data dello spettacolo e sala ordinati per data
select b.id_biglietto, sp.data_ora, s.nome_sala
from spettacoli sp
join sale s on sp.id_sala = S.id_sala
join biglietti b on b.id_spettacolo = sp.id_spettacolo
where sp.data_ora > '2026/01/18'
order by sp.data_ora asc;

-- 6. Trovare i film con più di 2 spettacoli e incasso totale superiore a 40€
select f.id_film, f.titolo, sum(b.prezzo) incasso_tot
from spettacoli sp
join film f on sp.id_film = f.id_film
join biglietti b on b.id_spettacolo = sp.id_spettacolo
group by f.id_film
having sum(sp.id_spettacolo) > 2
and (incasso_tot) > 40;

-- 7. Trovare le sale con incasso medio per genere maggiore di 10
select s.id_sala, s.nome_sala, sum(b.prezzo)/count(b.id_biglietto) media_guadagni
from spettacoli sp
join sale s on sp.id_sala = S.id_sala
join biglietti b on b.id_spettacolo = sp.id_spettacolo
group by s.id_sala
having 10 < (
	select sum(b.prezzo)/count(b.id_biglietto)
    from biglietti b);







