CREATE DATABASE CartoonsOfThe2000s


CREATE TABLE Nickelodeon
(
Show varchar(50) NOT NULL,
PremiereDate varchar(50) NOT NULL,
FinaleDate varchar(50),
Creator varchar(50) NOT NULL
)

CREATE TABLE CartoonNetwork
(
Show varchar(50) NOT NULL,
PremiereDate varchar(50) NOT NULL,
FinaleDate varchar(50),
Creator varchar(50) NOT NULL
)

CREATE TABLE AdultSwim
(
Show varchar(50) NOT NULL,
PremiereDate varchar(50) NOT NULL,
FinaleDate varchar(50),
Creator varchar(50) NOT NULL,
)

CREATE TABLE Fox
(
Show varchar(50) NOT NULL,
PremiereDate varchar(50) NOT NULL,
FinaleDate varchar(50),
Creator varchar(50) NOT NULL,
)

CREATE TABLE ComedyCentral
(
Show varchar(50) NOT NULL,
PremiereDate varchar(50) NOT NULL,
FinaleDate varchar(50),
Creator varchar(50) NOT NULL,
)

INSERT INTO Nickelodeon(Show, PremiereDate, FinaleDate, Creator)
VALUES 
('Spongebob SquarePants', 'May 1, 1999', NULL, 'Stephen Hillenburg'),
('Invader Zim', 'March 30, 2001', 'August 19, 2006', 'Jhonen Vasquez'),
('The Fairly Odd Parents', 'March 30, 2001', 'July 26, 2017', 'Butch Hartman'),
('My Life as a Teenage Robot', 'August 1, 2003', 'May 2, 2009', 'Rob Ronzetti'),
('Danny Phantom',  'April 3, 2004', 'August 24, 2007', 'Butch Hartman'),
('Avatar: The Last Airbender', 'February 21, 2005', 'July 19, 2008', 'Michael Dante DiMartino & Bryan Konietzko'),
('Catscratch','July 9, 2005', 'February 10, 2007','Doug TenNapel')

INSERT INTO CartoonNetwork(Show, PremiereDate, FinaleDate, Creator)
VALUES 
('The PowerPuff Girls', 'November 18, 1998', 'March 25, 2005', 'Craig McCracken'),
('Samurai Jack','August 10, 2001', 'September 25, 2004', 'Genndy Tartakovsky'),
('Teen Titans', 'July 19, 2003', 'September 15, 2006', 'Glen Murakami & Sam Register'),
('Fosters Home For Imaginary Friends', 'August 13, 2004', 'May 3, 2009', 'Craig McCracken'),
('Chowder','November 2, 2007','August 7, 2010','C.H. Greenblatt')

INSERT INTO AdultSwim(Show, PremiereDate, FinaleDate, Creator)
VALUES 
('Aqua Teen Hunger Force','December 30, 2000','August 30, 2015','Dave Willis & Matt Maiellaro'),
('The Venture Bros','August 7, 2004','October 7, 2018','Jackson Publick'),
('The Boondocks','November 6, 2005','June 23, 2014','Aaron McGruder')

SELECT * from Nickelodeon
SELECT * FROM CartoonNetwork
SELECT * FROM AdultSwim

SELECT SHOW FROM Nickelodeon
WHERE CREATOR='BUTCH HARTMAN'

SELECT * FROM CartoonNetwork 
LEFT JOIN AdultSwim
ON CartoonNetwork.Show=AdultSwim.Show

SELECT * FROM CartoonNetwork 
RIGHT JOIN AdultSwim
ON CartoonNetwork.Show=AdultSwim.Show

SELECT * FROM CartoonNetwork 
FULL OUTER JOIN AdultSwim
ON CartoonNetwork.Show=AdultSwim.Show
WHERE 