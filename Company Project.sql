--- Here is a company database I created using a dataset I had to use for an assignment. I re-created it and added my own number of queries.


CREATE DATABASE Company

CREATE TABLE Location
(Location_ID int PRIMARY KEY NOT NULL,
City varchar(100) NOT NULL
)


CREATE TABLE Department
(
Department_Id int NOT NULL,
name varchar(100) NOT NULL,
Location_id int NOT NULL,
PRIMARY KEY (Department_ID),
FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
)


CREATE TABLE Job
(
Job_Id int NOT NULL,
Designation varchar(100) NOT NULL
)

Create Table Employee
(
Employee_id int NOT NULL,
Last_Name varchar(100) NOT NULL,
First_Name varchar(100) NOT NULL,
Middle_Name varchar(100) NOT NULL,
Job_Id int NOT NULL,
Manager_Id int NOT NULL,
HireDate date NOT NULL,
Salary int NOT NULL,
Comm int,
Department_Id int NOT NULL,
FOREIGN KEY(Department_Id) REFERENCES Department(Department_Id),
)

ALTER TABLE Employee
ADD FOREIGN KEY (Job_Id) REFERENCES Job(Job_Id)

CREATE TABLE Salary_Grade
(
grade varchar(20) NOT NULL,
min_salary int NOT NULL,
max_salary int NOT NULL
)

INSERT INTO LOCATION(Location_ID, City)
VALUES
(122,'New York'),
(123,'Dallas'),
(124,'Chicago'),
(167,'Boston')

INSERT INTO DEPARTMENT(Department_Id,Name,Location_id)
VALUES
(10,'Accounting',122),
(20,'Sales',124),
(30,'Research',123),
(40,'Operations',167)

INSERT INTO JOB(Job_ID,Designation)
VALUES
(667,'Clerk'),
(668,'Staff'),
(669,'Analyst'),
(670,'Sales Person'),
(671,'Manager'),
(672,'President')


INSERT INTO Employee(Employee_Id, Last_Name, First_Name, Middle_Name, Job_ID, Manager_ID, HireDate, Salary, Comm, Department_Id)
VALUES
(7369, 'SMITH', 'JOHN', 'Q', 667, 7902, '17-DEC-84', 800, NULL, 20),
(7499, 'ALLEN', 'KEVIN', 'J', 670, 7698, '20-FEB-84', 1600, 300, 30),
(7505, 'DOYLE', 'JEAN', 'K', 671, 7839, '04-APR-85', 2850, NULL, 30),
(7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '15-MAY-85', 2750, NULL, 30),
(7507, 'BAKER', 'LESLIE', 'D', 671, 7839, '10-JUN-85', 2200, NULL, 40),
(7321, 'WARK', 'CYNTHIA', 'D', 670, 7698, '22-FEB-85', 1250, 500, 30)


INSERT INTO SALARY_GRADE(grade,min_salary,max_salary)
VALUES
('I',4000.00,5000.00),
('II',3000.00,3999.00),
('III',2000.00,2999.00),
('IV',1000.00,1999.00),
('V',300.00,999.00)

SELECT * FROM Employee
SELECT * FROM Department
SELECT * FROM Job
SELECT * FROM Location
SELECT * FROM Salary_Grade

----- Simple Queries

SELECT First_Name, Last_Name, HireDate FROM Employee

SELECT NAME FROM Department

SELECT FIRST_NAME, LAST_NAME, SALARY FROM Employee

----- GROUP & ORDER BY

SELECT FIRST_NAME, LAST_NAME, SALARY FROM Employee
ORDER BY SALARY DESC

SELECT AVG(SALARY) AS AVG_SALARY, First_Name, Last_Name FROM Employee
GROUP BY First_Name, Last_Name

SELECT First_Name, Last_Name, AVG(SALARY) AS AVG_SALARY FROM Employee
GROUP BY FIRST_NAME, LAST_NAME
ORDER BY AVG(SALARY)


-- Find employees who joined in the month of April

SELECT DATENAME(MM,HIREDATE) MONTH,COUNT(*) AS "Number of Employees"
FROM EMPLOYEE
WHERE DATENAME(MM,HIREDATE)='APRIL'
GROUP BY DATENAME(MM,HIREDATE)


-- Find employees who joined in the year of 1987

SELECT DATEPART(YY,HIREDATE) YEAR,COUNT(*) AS "Number of Employees"
FROM EMPLOYEE
WHERE DATEPART(YY,HIREDATE)=1984
GROUP BY DATEPART(YY,HIREDATE)





------ FUNCTIONS & WILDCARDS

SELECT COUNT(Employee_ID) FROM Employee

SELECT FIRST_NAME,LAST_NAME,SALARY FROM Employee
WHERE SALARY>1500
ORDER BY SALARY

SELECT DESIGNATION FROM JOB
WHERE Designation LIKE 'S%'

SELECT City FROM LOCATION
WHERE City LIKE '%Or%'

SELECT City FROM LOCATION
WHERE City LIKE 'N%' OR CITY LIKE 'C%'





------  SET OPERATORS

-- Unioning Department and Location with Location_Id
SELECT Location_id FROM DEPARTMENT
UNION 
SELECT Location_id FROM LOCATION

-- Unioning Employee and Department with Department_Id

SELECT Department_Id FROM Employee
UNION
SELECT Department_Id FROM Department

--- Joining Location with Employee

SELECT Employee_id, City From Employee
FULL JOIN Location
ON Employee.Employee_id = Location.Location_ID


--Find employees with Grade III salary

SELECT * FROM EMPLOYEE E,
SALARY_GRADE S
WHERE GRADE='III'

--Find employees with salary over 3000

SELECT * FROM EMPLOYEE E, SALARY_GRADE S
WHERE min_salary>3000





------ SUB QUERIES

--Find employees who work in 'Research' Department

SELECT * FROM Employee
WHERE DEPARTMENT_ID IN (SELECT Department_Id FROM Department WHERE NAME='RESEARCH')

--Look for employees who's job role is 'Sales Person'

SELECT * FROM EMPLOYEE
WHERE Job_Id IN (SELECT Job_Id FROM Job WHERE Designation='SALES PERSON')

--Locate employees who live in Boston

SELECT * FROM EMPLOYEE 
WHERE Department_Id IN (SELECT Department_Id FROM DEPARTMENT
WHERE LOCATION_ID IN (SELECT Location_Id FROM Location WHERE CITY='BOSTON'))

--Locate employees who live in Boston or Chicago

SELECT * FROM EMPLOYEE 
WHERE Department_Id IN (SELECT Department_Id FROM DEPARTMENT
WHERE LOCATION_ID IN (SELECT Location_Id FROM Location WHERE CITY='BOSTON' OR CITY='Chicago'))


