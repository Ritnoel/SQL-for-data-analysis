Create Table EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)


Create Table EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int
)



Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')


Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

select * from EmployeeDemographics
select * from EmployeeSalary

--subquery in select statement

select EmployeeID, Salary
from EmployeeSalary

select avg(salary)
from EmployeeSalary;


select EmployeeID, Salary, (select avg(salary) from EmployeeSalary) as Allaveragesalary
from EmployeeSalary;


select EmployeeID, Salary, avg(salary) over()as Allaveragesalary
from EmployeeSalary;


--subquery in from clause

select a.EmployeeID, Salary, Allaveragesalary
from 
	(select employeeID, Salary, avg(Salary) over() as Allaveragesalary
	from EmployeeSalary) a


--subquery in where clause
select *
from EmployeeSalary;

select *
from EmployeeDemographics
where Age > 30;

select EmployeeID, JobTitle, Salary
from EmployeeSalary
where EmployeeID in (
		select EmployeeID
		from EmployeeDemographics
		where Age > 30);


----CASE STATEMENT

select *,
CASE 
	when age >= 30 then 'adult'
	else 'young_adults'
END as age_range
From EmployeeDemographics
order by age;

select *,
CASE 
	when age >= 35 then 'adult'
	when age >=30 then 'mid_age'
	else 'young_adults'
END as age_range
From EmployeeDemographics
order by age;

select *,
CASE
	when age >= 30 then 'adult'
	when age between 25 and 30 then 'young_adults'
END
from EmployeeDemographics










