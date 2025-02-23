create database biblioteka;
use biblioteka;
CREATE TABLE autori
( id_autora INT PRIMARY KEY, 
ime VARCHAR(15) NOT NULL, 
prezime VARCHAR(15) NOT NULL );

CREATE TABLE izdavaci
( id INT PRIMARY KEY, 
naziv NVARCHAR(40) NOT NULL, 
adresa NVARCHAR(50), 
veb_sajt NVARCHAR(50) );

CREATE TABLE clanovi
( broj_clanske_karte INT PRIMARY KEY, 
ime NVARCHAR(15) NOT NULL, 
prezime NVARCHAR(15) NOT NULL, 
adresa NVARCHAR(50) NOT NULL, 
telefon NVARCHAR(20) NOT NULL,
mejl_adresa NVARCHAR(50) );

CREATE TABLE clanarine
( broj_clanske_karte INT REFERENCES clanovi(broj_clanske_karte), 
god INT NOT NULL, 
iznos INT NOT NULL, 
opis NVARCHAR(50), 
PRIMARY KEY (broj_clanske_karte, god) );

CREATE TABLE knjige
( id_knjige INT PRIMARY KEY, 
naziv NVARCHAR(50) NOT NULL, 
id_izdavaca INT NOT NULL REFERENCES izdavaci(id) );

CREATE TABLE primerci
( inventarski_broj INT PRIMARY KEY, 
id_knjige INT NOT NULL REFERENCES knjige(id_knjige) );


CREATE TABLE autori_knjige
(id_autora INT REFERENCES autori(id_autora),
id_knjige INT REFERENCES knjige(id_knjige), 
PRIMARY KEY (id_autora, id_knjige) );

CREATE TABLE zaposleni
( id INT PRIMARY KEY, 
ime NVARCHAR(15) NOT NULL, 
prezime NVARCHAR(15) NOT NULL,
mejl NVARCHAR(50),
datum_zaposlenja DATE NOT NULL,
plata INT NOT NULL,
id_menadzera INT REFERENCES zaposleni(id) );

CREATE TABLE pozajmice
( inventarski_broj INT REFERENCES primerci(inventarski_broj), 
broj_clanske_karte INT REFERENCES clanovi(broj_clanske_karte), 
datum_uzimanja DATE, 
datum_vracanja DATE, 
id_zaposlenog INT NOT NULL REFERENCES zaposleni(id),
PRIMARY KEY (inventarski_broj, broj_clanske_karte, datum_uzimanja), 
CHECK (datum_vracanja >= datum_uzimanja) );

CREATE TABLE kazne
( id_kazne INT PRIMARY KEY,
iznos INT NOT NULL,
datum DATE NOT NULL,  
inventarski_broj INT NOT NULL, 
broj_clanske_karte INT NOT NULL, 
datum_uzimanja DATE NOT NULL,
FOREIGN KEY (inventarski_broj, broj_clanske_karte, datum_uzimanja) 
REFERENCES pozajmice(inventarski_broj, broj_clanske_karte, datum_uzimanja) );


INSERT INTO autori
VALUES (101, 'Stanka', 'Matkovic')

INSERT INTO autori
VALUES (102, 'Mijodrag', 'Djurisic')

INSERT INTO autori
VALUES (103, 'Dusa', 'Vukovic')

INSERT INTO autori
VALUES (104, 'Stephen', 'Grosz')

INSERT INTO autori
VALUES (105, 'Marko', 'Vidojkovic')


INSERT INTO izdavaci
VALUES (1, 'Zavod za udzbenike', 'Obilicev venac 5, Beograd', 'http://www.knjizara.zavod.co.rs/')

INSERT INTO izdavaci
VALUES (2, 'CET', 'Knez Mihailova 6, Beograd', 'http://cet.rs/')

INSERT INTO izdavaci
VALUES (3, 'Vintage', 'Random House 20, London', 'www.vintage-books.co.uk')

INSERT INTO izdavaci
VALUES (4, 'Laguna', 'Resavska 33, Beograd', 'https://www.laguna.rs/')


INSERT INTO clanovi
VALUES (11, 'Milica', 'Zoranovic', 'Dunavska 22, Beograd', '061-111-111', null)

INSERT INTO clanovi
VALUES (22, 'Slavica', 'Mastilovic', 'Borska 1, Beograd', '062-222-332', 'slavica@gmail.com')

INSERT INTO clanovi
VALUES (33, 'Olivera', 'Stosic', 'Kneza 121, Beograd', '062-987-432', 'olja@gmail.com')

INSERT INTO clanovi
VALUES (44, 'Vukman', 'Mastilovic', 'Beogradska 8, Beograd', '061-323-656', 'vukman@gmail.com')

INSERT INTO clanovi
VALUES (55, 'Marko', 'Markovic', 'Krunska 9, Beograd', '065-221-221', 'marko@gmail.com')


INSERT INTO clanarine
VALUES (11, 2018, 3000, null)

INSERT INTO clanarine
VALUES (11, 2019, 3100, null)

INSERT INTO clanarine
VALUES (22, 2019, 3100, null)

INSERT INTO clanarine
VALUES (33, 2017, 2400, null)

INSERT INTO clanarine
VALUES (33, 2018, 2500, 'Popust za trudnice')

INSERT INTO clanarine
VALUES (33, 2019, 3100, null)

INSERT INTO clanarine
VALUES (44, 2019, 2000, 'Popust za ucenike')

INSERT INTO clanarine
VALUES (55, 2019, 2000, 'Popust za ucenike')
 

INSERT INTO knjige (id_knjige, naziv, id_izdavaca)
VALUES (111, 'Racunarstvo i informatika za 4. razred gimnazije', 1)

INSERT INTO knjige (id_knjige, naziv, id_izdavaca)
VALUES (222, 'Racunarstvo i informatika za 3. razred gimnazije', 1)

INSERT INTO knjige (id_knjige, naziv, id_izdavaca)
VALUES (321, 'Osnovi programiranja, programski jezici c#', 1)

INSERT INTO knjige (id_knjige, naziv, id_izdavaca)
VALUES (555, 'PROGRAMIRANJE - klase i objekti', 2)

INSERT INTO knjige (id_knjige, naziv, id_izdavaca)
VALUES (323, 'Veb programiranje', 2)

INSERT INTO knjige (id_knjige, naziv, id_izdavaca)
VALUES (999, 'The Examined Life', 3)

INSERT INTO knjige (id_knjige, naziv, id_izdavaca)
VALUES (414, 'Kandze', 4)

INSERT INTO knjige (id_knjige, naziv, id_izdavaca)
VALUES (415, 'E bas vam hvala', 4)
 

INSERT INTO primerci 
VALUES (12345, 111)

INSERT INTO primerci 
VALUES (12346, 111)

INSERT INTO primerci 
VALUES (12347, 222)

INSERT INTO primerci 
VALUES (12348, 321)

INSERT INTO primerci 
VALUES (12349, 321)

INSERT INTO primerci 
VALUES (13001, 555)

INSERT INTO primerci 
VALUES (13002, 555)

INSERT INTO primerci 
VALUES (13003, 555)


INSERT INTO primerci 
VALUES (13004, 555)

INSERT INTO primerci 
VALUES (13005, 555)

INSERT INTO primerci 
VALUES (14001, 323)

INSERT INTO primerci 
VALUES (14002, 323)

INSERT INTO primerci 
VALUES (14003, 323)

INSERT INTO primerci 
VALUES (15001, 999)

INSERT INTO primerci 
VALUES (16001, 414)

INSERT INTO primerci 
VALUES (17001, 415)

INSERT INTO primerci 
VALUES (17002, 415)

INSERT INTO primerci 
VALUES (17003, 415)


INSERT INTO autori_knjige
VALUES (101, 111)

INSERT INTO autori_knjige
VALUES (101, 222)

INSERT INTO autori_knjige
VALUES (101, 321)

INSERT INTO autori_knjige
VALUES (102, 321)

INSERT INTO autori_knjige
VALUES (103, 321)

INSERT INTO autori_knjige
VALUES (102, 111)

INSERT INTO autori_knjige
VALUES (102, 222)

INSERT INTO autori_knjige
VALUES (103, 111)

INSERT INTO autori_knjige
VALUES (103, 555)

INSERT INTO autori_knjige
VALUES (103, 323)

INSERT INTO autori_knjige
VALUES (101, 323)

INSERT INTO autori_knjige
VALUES (102, 323)

INSERT INTO autori_knjige
VALUES (104, 999)

INSERT INTO autori_knjige
VALUES (105, 414)

INSERT INTO autori_knjige
VALUES (105, 415)
 

INSERT INTO zaposleni
VALUES (1, 'Jovan', 'Jovanovic', 'jjovanovic@biblioteka.rs', '09/23/2002', 95000, null)

INSERT INTO zaposleni
VALUES (2, 'Vojin', 'Pupavac', 'vpupavac@biblioteka.rs', '11/20/2010', 70000, 1)

INSERT INTO zaposleni
VALUES (3, 'Ana', 'Milosavljevic', 'amilosavljevic@biblioteka.rs',
'10/25/2015', 60000, 1)

INSERT INTO zaposleni
VALUES (4, 'Nemanja', 'Granic', 'ngranic@biblioteka.rs', 
'11/20/2010', 62000, 1)

INSERT INTO zaposleni
VALUES (5, 'Aleksandar', 'Jovic', 'ajovic@biblioteka.rs', 
'05/25/2014',50000, 2)

INSERT INTO zaposleni
VALUES (6, 'Iva', 'Lazovic', 'ilazovic@biblioteka.rs', 
'07/20/2015', 50000, 2)

INSERT INTO zaposleni
VALUES (7, 'Lena', 'Kulic', 'lkulic@biblioteka.rs', 
'10/12/2017', 45000, 3)

INSERT INTO zaposleni
VALUES (8, 'Maja', 'Petrovic', 'mpetrovic@biblioteka.rs', 
'03/02/2015', 46000, 3)

INSERT INTO zaposleni
VALUES (9, 'Petar', 'Petrovic', 'ppetrovic@biblioteka.rs', 
'10/01/2017', 42000, 3)


INSERT INTO pozajmice
VALUES (12345, 33, '03/27/2019', 
'04/15/2019', 5)

INSERT INTO pozajmice
VALUES (12347, 33, '04/15/2019', 
'04/27/2019', 6)

INSERT INTO pozajmice
VALUES (12349, 33, '04/15/2019',
'05/20/2019', 6)

INSERT INTO pozajmice
VALUES (13003, 33, '05/20/2019', null , 5)

INSERT INTO pozajmice
VALUES (17003, 33, '05/20/2019', null , 5)

INSERT INTO pozajmice
VALUES (13001, 22, '10/10/2018', 
'02/18/2019', 5)

INSERT INTO pozajmice
VALUES (17001, 22, '02/18/2019', 
'02/25/2019', 6)

INSERT INTO pozajmice
VALUES (13005, 22, '02/25/2019', 
'03/07/2019', 5)

INSERT INTO pozajmice
VALUES (16001, 22, '03/07/2019', 
'05/21/2019', 5)

INSERT INTO pozajmice
VALUES (17002, 22, '05/21/2019', null, 6)

INSERT INTO pozajmice
VALUES (12345, 22, '05/21/2019', null, 6)

INSERT INTO pozajmice
VALUES (12347, 22, '05/21/2019', null, 6)

INSERT INTO pozajmice
VALUES (17003, 55, '01/15/2019',
'04/15/2019', 5)

INSERT INTO pozajmice
VALUES (15001, 11, '03/15/2019',
'04/01/2019', 6)

INSERT INTO pozajmice
VALUES (16001, 11, '04/01/2019',
'04/16/2019', 6)

INSERT INTO pozajmice
VALUES (12345, 11, '04/16/2019',
'04/28/2019', 6)

INSERT INTO pozajmice
VALUES (12347, 11, '04/28/2019',
'05/22/2019', 6)

INSERT INTO pozajmice
VALUES (12349, 11, '05/22/2019', null, 6)


INSERT INTO kazne
VALUES (1, 500, '02/18/2019', 13001, 22, '10/10/2018')

INSERT INTO kazne
VALUES (2, 500, '05/21/2019', 16001, 22, '03/07/2019')

INSERT INTO kazne
VALUES (3, 400, '04/15/2019', 17003, 55, '01/15/2019')


SELECT * FROM knjige

SELECT * FROM CLANOVI

SELECT * FROM clanovi

SELECT * FROM CLANOVI

SELECT * FROM clanOVI

SELECT * FROM clanovi

