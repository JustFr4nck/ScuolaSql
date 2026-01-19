-- _____CREAZIONE SCHEMA_____

drop schema if exists quintab_voli;
create schema quintab_voli;
use quintab_voli;

create table Aeroporto(
idA int(20) primary key auto_increment,
    nomeA varchar(45) not null,
    cittaA varchar(45) not null,
    nazioneA varchar(45) not null
);

create table CompagniaAerea(
idCA int(20) primary key auto_increment,
    nomeCA varchar(45) not null,
    nazionalitaCA varchar(45) not null
);

create table TrattaDiVolo(
idTDV int(20) primary key auto_increment,
    partenzaTDV int(20) not null,
    arrivoTDV int(20) not null,
    foreign key (partenzaTDV) references Aeroporto(idA),
    foreign key (arrivoTDV) references Aeroporto(idA)
);

create table Volo(
idV int(20) primary key auto_increment,
    passeggeriV int(3) unsigned not null,
    dataV date not null,
    compagniaAereaV int(20) not null,
    trattaDiVoloV int(20) not null,
    foreign key (compagniaAereaV) references CompagniaAerea(idCA),
    foreign key (trattaDiVoloV) references TrattaDiVolo(idTDV)
);

-- ______INSERIMENTO DATI______

-- Inserimento compagnie aeree
INSERT INTO CompagniaAerea (nomeCA, nazionalitaCA) VALUES
('Alitalia', 'Italia'),
('Lufthansa', 'Germania'),
('American Airlines', 'Stati Uniti'),
('Emirates', 'Emirati Arabi Uniti');

-- Inserimento aeroporti
INSERT INTO Aeroporto (nomeA, cittaA, nazioneA) VALUES
('Fiumicino', 'Roma', 'Italia'),
('Linate', 'Milano', 'Italia'),
('Frankfurt', 'Francoforte', 'Germania'),
('JFK', 'New York', 'Stati Uniti'),
('DXB', 'Dubai', 'Emirati Arabi Uniti');

-- Inserimento tratte di volo
INSERT INTO TrattaDiVolo (partenzaTDV, arrivoTDV) VALUES
(1, 3),  -- Roma Fiumicino a Francoforte
(1, 4),  -- Roma Fiumicino a New York JFK
(2, 5),  -- Milano Linate a Dubai
(3, 1);  -- Francoforte a Roma Fiumicino

-- Inserimento voli, incluso alcuni del 2018
INSERT INTO Volo (passeggeriV, dataV, compagniaAereaV, trattaDiVoloV) VALUES
(150, '2018-05-10', 1, 1),  -- Alitalia, Roma a Francoforte
(200, '2018-06-15', 2, 3),  -- Lufthansa, Francoforte a Roma
(300, '2018-07-20', 3, 2),  -- American Airlines, Roma a New York
(250, '2018-08-25', 4, 4),  -- Emirates, Milano a Dubai
(180, '2018-09-05', 1, 2),  -- Alitalia, Milano a New York
(120, '2023-10-30', 1, 1);   -- Volo recente per confronto

INSERT INTO CompagniaAerea (nomeCA, nazionalitaCA) VALUES
('Air France', 'Francia'),
('British Airways', 'Regno Unito'),
('KLM', 'Paesi Bassi'),
('Turkish Airlines', 'Turchia');

-- Inserimento ulteriori aeroporti
INSERT INTO Aeroporto (nomeA, cittaA, nazioneA) VALUES
('Charles de Gaulle', 'Parigi', 'Francia'),
('Heathrow', 'Londra', 'Regno Unito'),
('Amsterdam Schiphol', 'Amsterdam', 'Paesi Bassi'),
('Istanbul Airport', 'Istanbul', 'Turchia'),
('Los Angeles International', 'Los Angeles', 'Stati Uniti');

-- Inserimento ulteriori tratte di volo
INSERT INTO TrattaDiVolo (partenzaTDV, arrivoTDV) VALUES
(1, 6),  -- Roma Fiumicino a Los Angeles
(2, 5),  -- Milano Linate a New York
(3, 1),  -- Francoforte a Roma
(4, 2),  -- New York a Londra
(5, 4),  -- Dubai a Istanbul
(6, 3);  -- Los Angeles a Amsterdam

-- Inserimento ulteriori voli
INSERT INTO Volo (passeggeriV, dataV, compagniaAereaV, trattaDiVoloV) VALUES
(160, '2018-10-01', 1, 1),  -- Alitalia, Roma a Francoforte
(180, '2018-11-12', 2, 2),  -- Lufthansa, Milano a New York
(220, '2018-12-20', 3, 3),  -- American Airlines, Roma a New York
(200, '2019-01-15', 4, 4),  -- Emirates, Milano a Dubai
(170, '2019-02-10', 1, 5),  -- Alitalia, Roma a Los Angeles
(500, '2019-02-10', 1, 3),  -- Roma Fiumicino a Francoforte
(130, '2019-03-25', 2, 6),  -- Lufthansa, Milano a Amsterdam
(140, '2023-11-05', 3, 1),  -- Volo recente, Francoforte a Roma
(150, '2023-11-15', 4, 2);   -- Volo recente, New York a Londra


-- _____INTERROGAZIONE DEL DB(query)_____

-- Il numero totale di passeggeri nei voli di una certa data
select SUM(v.passeggeriV) nPasseggeri
from Volo v
where dataV = '2019-02-10';

-- La lista delle Compagnie aeree e delle nazionalità, con il numero totale dei passeggeri in ordine decrescente in base al totale dei passeggeri
select c.*, v.passeggeriV
from Volo v
join CompagniaAerea c on v.compagniaAereaV = c.idCA
group by v.passeggeriV desc;

-- La lista delle nazionalità (delle Compagnie aeree) insieme al totale dei passeggeri in ordine decrescente in base al totale dei passeggeri
select c.nazionalitaCA, sum(v.passeggeriV) numPass
from Volo v
join CompagniaAerea c on v.compagniaAereaV = c.idCA
group by c.nazionalitaCA
order by numPass desc;

-- La lista senza ripetizioni delle tratte di volo (aeroporto di partenza e di arrivo con relative città e nazioni) percorse ad una certa data
select distinct partenza.cittaa p_citta, partenza.nazionea p_nazione, partenza.nomea p_nome,
arrivo.cittaa a_citta, arrivo.nazionea a_nazione, arrivo.nomea a_nome
from TrattaDiVolo t
join Volo v on t.idtdv = v.trattaDiVoloV
join aeroporto arrivo on t.arrivotdv = arrivo.ida
join aeroporto partenza on t.partenzatdv = partenza.ida
where v.datav = '2019-02-10';

-- La lista dei voli (partenza, arrivo, passeggeri e data) effettuati fra due date, ordinata per nome dell'aeroporto di partenza
select distinct t.*, partenza.nomea aeroporto_partenza, v.passeggeriv n_passeggeri, v.datav data_viaggio
from TrattaDiVolo t
join aeroporto partenza on t.partenzatdv = partenza.idA
join aeroporto arrivo on t.arrivotdv = arrivo.ida
join Volo v on t.idtdv = v.trattaDiVolov
where v.datav > '2018-05-10' and v.datav < '2018-08-25'
order by partenza.nomea asc;

-- Il numero dei voli effettuati da ciascuna Compagnia aerea, ordinata in modo decrescente per numero dei voli
select ca.nomeCa, count(v.idv) n_voli
from CompagniaAerea ca
join Volo v on ca.idCa = v.compagniaAereaV
group by ca.nomeCa
order by n_voli desc;

-- Il maggior numero di passeggeri a bordo di un volo partito dall’aeroporto “Amerigo Vespucci”
-- inesistente aeroporto "Amerigo Vespucci"


-- La lista delle tratte di volo (partenza e arrivo) che sono state percorse almeno 7 volte
select t.*
from TrattaDiVolo t
join Volo v on t.idTDV = v.trattaDiVoloV
where year(v.dataV) = 2018
group by t.idTDV
having COUNT(v.idV) = 7;

-- La lista delle Compagnie aeree che hanno trasportato in totale almeno 400 passeggeri nel mese di marzo 2018
select *
from compagniaAerea ca
join volo v on ca.idCa = v.compagniaaereaV
where year(v.datav) = 2018
group by ca.idca
having v.passeggeriv >= 400;

-- ______MODIFICA CONTENUTO TABELLE______







