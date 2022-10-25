---creating a datavase
CREATE DATABASE tech4dev;

---to see all the databases
EXEC sp_databases;

---create a table
USE Digiyouth_Database;
CREATE TABLE students(
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR(25)
)

---alter table to add new column
ALTER TABLE students ADD Gender VARCHAR(20);

--alter table to drop a column
ALTER TABLE students DROP COLUMN Gender;

--Inserting records into a table
INSERT INTO students (ID, NAME, AGE, ADDRESS)
VALUES (1, 'chiamaka', 15, 'Enugu');

INSERT INTO students (ID, NAME, AGE, ADDRESS)
VALUES (2, 'shuaibu', 16, 'kogi');

INSERT INTO students (ID, NAME, AGE, ADDRESS)
VALUES (3, 'esther', 17, 'Osun');

INSERT INTO students (ID, NAME, AGE, ADDRESS)
VALUES (4, 'mercy', 18, 'lagos');

INSERT INTO students
VALUES (5, 'rit', 19, 'kaduna');


ALTER TABLE students ADD Gender varchar(20);

UPDATE students SET Gender = 'Female' WHERE ID = 1;
UPDATE students SET Gender = 'Male' WHERE ID = 2;
UPDATE students SET Gender = 'Female' WHERE ID = 3;
UPDATE students SET Gender = 'Female' WHERE ID = 4;
UPDATE students SET Gender = 'Female' WHERE ID = 5;

---DROP TABLE IF EXISTS students



SELECT * FROM students;

SELECT ID,NAME FROM students;

--ORDER OF EXECUTION
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY
--LIMIT 

CREATE TABLE Employees(
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR(25),
SALARY INT
)

INSERT INTO Employees (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (1, 'chiamaka', 15, 'Enugu',33000);

INSERT INTO Employees (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (2, 'shuaibu', 16, 'kogi', 40000);

INSERT INTO Employees (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (3, 'esther', 17, 'Osun', 50000);

INSERT INTO Employees (ID, NAME, AGE, ADDRESS, SALARY)
VALUES (4, 'mercy', 18, 'lagos', 70000);

INSERT INTO Employees
VALUES (5, 'rit', 19, 'kaduna', 60000);

ALTER TABLE Employees ADD Gender varchar(20);

UPDATE Employees SET Gender = 'Female' WHERE ID = 1;
UPDATE Employees SET Gender = 'Male' WHERE ID = 2;
UPDATE Employees SET Gender = 'Female' WHERE ID = 3;
UPDATE Employees SET Gender = 'Female' WHERE ID = 4;
UPDATE Employees SET Gender = 'Female' WHERE ID = 5;



--WHERE CLAUSE
select * 
from Employees
where SALARY > 50000;

select*
from Employees
where SALARY = 50000;

select *
from Employees
where NAME = 'rit';

--ALIAS
select ID, NAME, AGE, ADDRESS, salary as salary_greater_than_50000
from Employees
where SALARY > 50000;

--COUNT
select count(salary) as salary_greater_than_50000
from Employees
where salary > 50000

--GROUPBY
select Gender, avg(salary) as average_salary
from Employees
group by Gender;

Insert into Employees
values(6, 'ikrama', 20, 'jos', 80000, 'Male');

--HAVING
select Gender,age, avg(salary) as average_salary 
from Employees
group by age, gender
having age >18

--ORDER BY
Select * from Employees
Order by salary desc;

--ORDER BY WITH MULTIPLE COLUMNS
Select name, age, salary
from Employees
where gender ='female'
order by AGE desc, salary asc;

--Finding the top values
SELECT TOP 3
ID, NAME, AGE, ADDRESS, SALARY
FROM Employees


SELECT TOP 3 *
FROM Employees

--AND OPERATOR
Select name, age, address
from Employees
where age > 18 and ADDRESS = 'Osun' and Gender ='female'

--OR OPERATOR
select name, age, address, Gender 
from Employees
where age > 18 or address = 'Osun' or Gender = 'female'

--LIKE OPERATOR
--LIKE C% - Finds any values that starts with the letter “C”
--LIKE %C - Finds any values that end with the letter “C”
--LIKE %re% - Finds values that ‘re’ in any position
--LIKE _a% - Finds any value that have the letter ‘a’ in the second index.
--LIKE a_%_% - Finds any values that starts with ‘a’ and are atleast 3 characters in length
--LIKE a%r - find any values that starts with ‘a’ and end ‘r’


SELECT *
from Employees
where NAME like '_ercy';

SELECT *
from Employees
where NAME like 'c%';

SELECT *
from Employees
where NAME like '%t';

SELECT *
from Employees
where NAME like '%e%';

--BETWEEN
SELECT *
FROM Employees
where age between 16 and 19

--IN
select name, address, salary 
from Employees
where ADDRESS in('lagos','kaduna');

--NOT IN
select name, address, salary
from Employees
where ADDRESS not in('lagos','kaduna')

--DISTINCT
SELECT distinct(address) 
from Employees

SELECT count(distinct(address))
from Employees;

select distinct address
from Employees
where gender = 'female';

select max(salary) as maximum_salary, min(salary) as minimum_salary
from Employees
where gender = 'female'

select max(salary) as maximum_salary, min(salary) as minimum_salary
from Employees
where gender = 'male'

select max(salary) as maximum_salary, min(salary) as minimum_salary, gender
from Employees
group by gender;

select sum(salary) as total_salary, gender
from Employees
group by gender;

select name, round(salary, 1) as rounded_salary
from Employees

select name, salary, (salary * 0.25) as BONUS
FROM Employees

select name, salary, (salary * 0.25) as BONUS, (salary + (salary * 0.25)) as Bonus_salary
From Employees

select (salary + age)
from Employees



select * from Employees; 








