
-- ___create schema___

drop schema if exists biblioteca_test;
create schema biblioteca_test;
use biblioteca_test;

-- ___create tables___

create table Autore(
    id_autore int(11) primary key auto_increment,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    nazionalita varchar(50),
    data_nascita date not null
);

create table Genere(
    id_genere int(11) primary key auto_increment,
    descrizione varchar(50) not null
);

create table Studente(
	matricola int(11) primary key auto_increment,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    corso_laurea varchar(100),
    anno_iscrizione int(11)
);

create table Libro(
	id_libro int(11) primary key auto_increment,
    titolo varchar(100) not null,
    anno_pubblicazione int(11) not null,
    editore varchar(100) not null,
    lingua varchar(30) not null,
    numero_pagine int(11),
    valutazione decimal(3,1) not null,
    id_genere int(11) not null,
	foreign key (id_genere) references Genere(id_genere)
);

create table Scrive(
	id_autore int(11) not null,
    id_libro int(11) not null,
    ruolo varchar(50),
    foreign key(id_autore) references Autore(id_autore),
    foreign key(id_libro) references Libro(id_libro)
);

create table Prestito(
	id_prestito int(11) primary key auto_increment,
    id_libro int(11) not null,
    matricola int(11) not null,
    data_prestito date not null,
    data_restituzione date not null,
    foreign key (id_libro) references Libro(id_libro),
    foreign key (matricola) references Studente(matricola)
);


-- ___Insert data___

INSERT INTO Genere (id_genere, descrizione) VALUES
(1, 'Saggistica'),
(2, 'Storico'),
(3, 'Narrativa'),
(4, 'Fantasy'),
(5, 'Giallo'),
(6, 'Biografia'),
(7, 'Scientifico'),
(8, 'Poesia'),
(9, 'Avventura'),
(10, 'Manuale');

INSERT INTO Autore (id_autore, nome, cognome, nazionalita, data_nascita) VALUES
(1, 'Umberto', 'Eco', 'Italiana', '1932-01-05'),
(2, 'George', 'Orwell', 'Britannica', '1903-06-25'),
(3, 'J.K.', 'Rowling', 'Britannica', '1965-07-31'),
(4, 'Alessandro', 'Barbero', 'Italiana', '1959-04-30'),
(5, 'Italo', 'Calvino', 'Italiana', '1923-10-15'),
(6, 'Isaac', 'Asimov', 'Statunitense', '1920-01-02'),
(7, 'Yuval', 'Harari', 'Israeliana', '1976-02-24'),
(8, 'Jane', 'Austen', 'Britannica', '1775-12-16'),
(9, 'Dan', 'Brown', 'Statunitense', '1964-06-22'),
(10, 'Primo', 'Levi', 'Italiana', '1919-07-31');

INSERT INTO Libro 
(id_libro, titolo, anno_pubblicazione, editore, lingua, numero_pagine, valutazione, id_genere)
VALUES
(1, 'Il nome della rosa', 1980, 'Bompiani', 'Italiano', 520, 9.0, 3),
(2, 'Apocalittici e integrati', 1964, 'Bompiani', 'Italiano', 600, 8.5, 1),
(3, '1984', 1949, 'Secker & Warburg', 'Inglese', 328, 9.2, 3),
(4, 'Animal Farm', 1945, 'Secker & Warburg', 'Inglese', 112, 8.8, 3),
(5, 'Harry Potter', 1997, 'Bloomsbury', 'Inglese', 450, 8.0, 4),
(6, 'Dante', 2007, 'Laterza', 'Italiano', 650, 8.7, 2),
(7, 'Il barone rampante', 1957, 'Einaudi', 'Italiano', 300, 8.3, 3),
(8, 'Fondazione', 1951, 'Gnome Press', 'Inglese', 255, 8.9, 4),
(9, 'Sapiens', 2011, 'Harvill Secker', 'Inglese', 498, 9.1, 1),
(10, 'Se questo è un uomo', 1947, 'Einaudi', 'Italiano', 240, 9.4, 6),
(11, 'Dire quasi la stessa cosa', 2003, 'Bompiani', 'Italiano', 240, 8.4, 1),
(12, 'Homo Deus', 2015, 'Harvill Secker', 'Inglese', 450, 9.0, 1),
(13, 'La battaglia di Niccolò', 2015, 'Laterza', 'Italiano', 320, 8.5, 3);

INSERT INTO Scrive (id_autore, id_libro, ruolo) VALUES
(1, 1, 'Autore'),
(1, 2, 'Autore'),
(2, 3, 'Autore'),
(2, 4, 'Autore'),
(3, 5, 'Autore'),
(4, 6, 'Autore'),
(5, 7, 'Autore'),
(6, 8, 'Autore'),
(7, 9, 'Autore'),
(10, 10, 'Autore'),
(1, 11, 'Autore'),
(7, 12, 'Autore'),
(4, 13, 'Autore');

INSERT INTO Studente (matricola, nome, cognome, corso_laurea, anno_iscrizione) VALUES
(1001, 'Mario', 'Rossi', 'Informatica', 2022),
(1002, 'Laura', 'Bianchi', 'Lettere', 2021),
(1003, 'Luca', 'Verdi', 'Informatica', 2022),
(1004, 'Anna', 'Neri', 'Fisica', 2020),
(1005, 'Paolo', 'Russo', 'Matematica', 2021),
(1006, 'Chiara', 'Galli', 'Informatica', 2023),
(1007, 'Marco', 'Fontana', 'Storia', 2020),
(1008, 'Sara', 'Moretti', 'Lettere', 2022),
(1009, 'Giulia', 'Marini', 'Informatica', 2021),
(1010, 'Davide', 'Ferrari', 'Economia', 2023);

INSERT INTO Prestito
(id_prestito, id_libro, matricola, data_prestito, data_restituzione)
VALUES
(1, 1, 1001, '2022-02-10', '2022-02-20'),
(2, 1, 1002, '2021-03-15', '2021-03-30'),
(3, 1, 1003, '2022-05-10', '2022-05-25'),
(4, 3, 1001, '2022-04-01', '2022-04-15'),
(5, 3, 1004, '2020-06-10', '2020-06-25'),
(6, 6, 1007, '2020-09-10', '2020-09-30'),
(7, 7, 1005, '2021-11-05', '2021-11-20'),
(8, 10, 1008, '2022-10-01', '2022-10-20'),
(9, 1, 1009, '2021-02-12', '2021-02-25'),
(10, 2, 1006, '2023-03-15', '2023-03-30');


-- ___query___

-- Trovare il/i libro/i scritti in lingua italiana con il maggior numero di pagine. Visualizzare: titolo, numero_pagine.
select l.titolo, l.numero_pagine 
from Libro l
where l.lingua = 'Italiano' 
and numero_pagine = 
	(select max(numero_pagine)
	from libro l
    where l.lingua = 'Italiano');
    
-- Visualizzare id_autore, nome e cognome degli autori che hanno scritto almeno due libri del genere Saggistica
select a.id_autore, a.nome, a.cognome
from scrive s
join autore a on s.id_autore = a.id_autore
join libro l on s.id_libro = l.id_libro
join genere g on l.id_genere = g.id_genere
where g.descrizione = 'Saggistica' 
group by a.id_autore
having count(*) >= 2;

-- Trovare gli editori che hanno pubblicato meno libri della media dei libri pubblicati da tutti gli editori.
select editore
from Libro
group by editore
having COUNT(*) < (
    select avg(num_libri)
    from (
        select COUNT(*) as num_libri
        from Libro
        group by editore
    ) as conteggi
);

-- Trovare gli autori che hanno scritto libri del genere Storico e Narrativa, ma non del genere Fantasy.
select a.id_autore, a.nome, a.cognome
from scrive s
join autore a on s.id_autore = a.id_autore
join libro l on s.id_libro = l.id_libro
join genere g on l.id_genere = g.id_genere
group by a.id_autore
having sum(g.descrizione = 'Storico') > 0
	and sum(g.descrizione = 'Narrativa') > 0
    and sum(g.descrizione = 'Fantasy') = 0;
    
-- Elencare i libri in lingua straniera che non sono mai stati presi in prestito da studenti del corso di laurea Informatica.
select l.* 
from prestito p
join libro l on p.id_libro = l.id_libro
join studente s on p.matricola = s.matricola
where l.lingua != 'Italiano'
group by l.id_libro
having sum(s.corso_laurea = 'Informatica') = 0;

-- Per ogni libro trovare il numero di prestiti e visualizzare gli autori che li hanno scritti.
select l.titolo, count(id_prestito) n_prestiti, a.nome nome_autore  
from scrive s
join autore a on s.id_autore = a.id_autore
join libro l on s.id_libro = l.id_libro
join prestito p on p.id_libro = l.id_libro
group by l.id_libro;

-- Per ogni studente, calcolare il numero di libri presi in prestito nell’ anno di iscrizione (utilizzare la funzione YEAR).
select s.nome, count(l.id_libro) n_libri
from prestito p
join libro l on p.id_libro = l.id_libro
join studente s on p.matricola = s.matricola
where year(p.data_prestito) = s.anno_iscrizione 
group by s.matricola;

--  Per ogni nazionalità degli autori, visualizzare il numero di libri presi in prestito almeno una volta, ordinando il risultato in ordine crescente.
select a.nazionalita, count(distinct p.id_prestito) n_prestiti
from scrive s
join autore a on s.id_autore = a.id_autore
join libro l on s.id_libro = l.id_libro
join prestito p on p.id_libro = l.id_libro
group by a.nazionalita
order by count(p.id_prestito) asc;











