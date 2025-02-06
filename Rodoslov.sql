CREATE DATABASE Rodoslov
USE Rodoslov

CREATE TABLE osoba
(
	id int PRIMARY KEY,
    ime varchar(20),
    prezime varchar(20),
    pol varchar(1),
    id_mama int FOREIGN KEY REFERENCES osoba(id),
	id_tata int FOREIGN KEY REFERENCES osoba(id)
)

--2
INSERT INTO osoba
VALUES (1, 'Uros', 'Milicevic', 'M', 2, 3)
INSERT INTO osoba
VALUES (2, 'Natalija', 'Milicevic', 'Z', 4, 5)
INSERT INTO osoba
VALUES (3, 'Radivoje', 'Milicevic', 'M', 6, 7)
INSERT INTO osoba
VALUES (4, 'Milka', 'Dimic', 'Z', 8, 9)
INSERT INTO osoba
VALUES (5, 'Milan', 'Dimic', 'M', 10, 11)
INSERT INTO osoba
VALUES (6, 'Dragica', 'Milicevic', 'Z', 12, 13)
INSERT INTO osoba
VALUES (7, 'Ratko', 'Milicevic', 'M', 14, 15)
INSERT INTO osoba
VALUES (8, 'Milica', 'Radmanovic', 'Z', NULL, NULL)
INSERT INTO osoba
VALUES (9, 'Petar', 'Radmanovic', 'M', NULL, NULL)
INSERT INTO osoba
VALUES (10, 'Jelena', 'Dimic', 'Z', NULL, NULL)
INSERT INTO osoba
VALUES (11, 'Jovan', 'Dimic', 'M', NULL, NULL)
INSERT INTO osoba
VALUES (12, 'Jelena', 'Rajcevic', 'Z', NULL, NULL)
INSERT INTO osoba
VALUES (13, 'Petar', 'Rajcevic', 'M', NULL, NULL)
INSERT INTO osoba
VALUES (14, 'Maja', 'Milicevic', 'Z', NULL, NULL)
INSERT INTO osoba
VALUES (15, 'Brka', 'Milicevic', 'M', NULL, NULL)
INSERT INTO osoba
VALUES (16, 'Marko', 'Milicevic', 'M', 2, 3)
INSERT INTO osoba
VALUES (17, 'Sasa', 'Dimic', 'M', 4, 5)
INSERT INTO osoba
VALUES (18, 'Vlade', 'Milicevic', 'M', 6, 7)
INSERT INTO osoba
VALUES (19, 'Vera', 'Radmanovic', 'Z', 8, 9)


select *  from osoba order by id

--3
SELECT m.*
FROM osoba m JOIN osoba x ON x.id_mama = m.id
WHERE x.id = 1

--4
SELECT t. *
FROM osoba t JOIN osoba x ON x.id_tata = t.id
WHERE x.id = 16

--5
SELECT m.*, t.*
FROM (osoba t JOIN osoba x ON x.id_tata = t.id) JOIN osoba m ON x.id_mama = m.id
WHERE x.id = 16

--6
SELECT *
FROM osoba
WHERE id_tata = 2 OR id_mama = 2

--7
SELECT b.*
FROM (osoba m JOIN osoba x ON x.id_mama = m.id) JOIN osoba b ON m.id_mama = b.id
WHERE x.id = 1

--8
SELECT *
FROM osoba
WHERE id_tata = (select id_tata FROM osoba
WHERE id = (select id_mama FROM osoba
WHERE id = 2))
	and
id <> (SELECT id_mama FROM osoba
WHERE id = 2)

 --9
SELECT *
FROM osoba
WHERE id_tata = (SELECT id_tata  FROM osoba
WHERE id = (SELECT id_tata FROM osoba
WHERE id = 1))
	and
id <> (SELECT id_tata FROM osoba
WHERE id = 1)

--10
CREATE FUNCTION mama(@id int)
RETURNS TABLE
AS
RETURN
(
SELECT m.*
FROM osoba m JOIN osoba x ON x.id_mama = m.id
WHERE x.id = @id
)

SELECT * from dbo.mama(2)
                
--11
SELECT * FROM dbo.mama((SELECT id FROM dbo.mama(2)))

--12
CREATE function deca (@id INT)
RETURNS TABLE
AS
RETURN (SELECT * FROM osoba
WHERE id_tata = @id or id_mama = @id)

drop function deca

SELECT * FROM dbo.deca(8)

--13
SELECT * from dbo.deca((SELECT id FROM dbo.mama((SELECT id FROM dbo.mama(1)))))