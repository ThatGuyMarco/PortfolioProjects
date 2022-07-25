
-- I wanted to create a weapons store that sells swords, staffs, and artillery from around the world.

CREATE TABLE Totally_Imported_Weapons
(name varchar(100),
description varchar(255),
price float,
rating float,
availabilty varchar(10),
in_stock int
)

-- Here are some listings in store.

INSERT INTO Totally_Imported_Weapons values ('Japanese Katana', 'authentic Japanese broadsword made of hard steel', 209.99, 5, 'yes', 10)
INSERT INTO Totally_Imported_Weapons values ('Bamboo Club', 'made from bamboo in the mountains of Central China', 159.99, 4.5, 'yes', 28)
INSERT INTO Totally_Imported_Weapons values ('Marble Throwing Disk','imported from the marble sanctuaries of Greece', 124.99, 4.5, 'yes', 63)
INSERT INTO Totally_Imported_Weapons values ('Impaling Spear','a piercing staff from the Andes Mountain range, made from uncut emeralds', 249.99, 5, 'limited', 12)

SELECT name FROM Totally_Imported_Weapons

SELECT * FROM Totally_Imported_Weapons

--- Here are some more listings I put up. However, some aren't available.

INSERT INTO Totally_Imported_Weapons values ('Steel Mortar', 'german cannon used to defend blast away at foreign enemies', 599.99, 5, 'yes', 3)
INSERT INTO Totally_Imported_Weapons values ('Siberian Dual-Picks', 'Russian ice climbing tools which also happen to be very sharp', 201.99, 4.8, 'yes', 4)
INSERT INTO Totally_Imported_Weapons values ('Mongolian Nunchuks','legend has it, this was a weapon that Genghis Khan once possessed', 1299.99, 5, 'n/a', NULL)
INSERT INTO Totally_Imported_Weapons values ('Egyptian staff','apparently, this staff contains the soul of an egyptian prince. Some say it has magic powers', 2200.99, 5, 'n/a', NULL)

SELECT NAME FROM Totally_Imported_Weapons WHERE RATING=5 

--- I accidentally created duplicate values, so I had to delete these so I can re-insert them.

DELETE FROM Totally_Imported_Weapons
WHERE NAME='STEEL MORTAR'

DELETE FROM Totally_Imported_Weapons
WHERE NAME='SIBERIAN DUAL-PICKS'

--- Queries

SELECT NAME, RATING FROM Totally_Imported_Weapons WHERE RATING BETWEEN 4 AND 5

SELECT MIN(PRICE) AS minimum_price, AVG(PRICE) AS average_price, MAX(PRICE) as maximum_price FROM Totally_Imported_Weapons

SELECT NAME, PRICE FROM Totally_Imported_Weapons WHERE PRICE BETWEEN 200 AND 600

SELECT NAME FROM Totally_Imported_Weapons WHERE NAME LIKE 'S%'

SELECT NAME FROM Totally_Imported_Weapons WHERE NAME LIKE '%A'

