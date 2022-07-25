CREATE DATABASE California_CrimeData



SELECT * FROM [dbo].[ca_offenses_by_city$]



SELECT CITY, POPULATION FROM [dbo].[ca_offenses_by_city$]

SELECT CITY, POPULATION, [Violent crime] FROM [dbo].[ca_offenses_by_city$] 

SELECT [Violent crime] FROM [dbo].[ca_offenses_by_city$]
WHERE CITY='LOS ANGELES' 

SELECT CITY, ARSON, [Property crime] FROM [dbo].[ca_offenses_by_city$]
WHERE CITY='LOS ANGELES' OR CITY='SAN DIEGO' OR CITY='SAN FRANCISCO'
ORDER BY CITY

SELECT SUM([Murder and nonnegligent manslaughter]) AS Total_Homicides, SUM([Rape (revised definition)]) AS Total_Rapes FROM [dbo].[ca_offenses_by_city$]