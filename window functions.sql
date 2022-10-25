--over()
--partition()
--lag()
--lead()
--rank()
--dense_rank()

create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh', 'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);

select * from employee;

select dept_name, max(salary) as maximum_salary
from employee
group by DEPT_NAME;

--over
select *,
max(salary) over() as maximum_salary
from employee;

--partition
select *,
max(salary) over(partition by dept_name) as maximum_salary
from employee;


--row number
select *,
row_number() over(order by dept_name) as rn
from employee

select *,
row_number() over(partition by dept_name order by dept_name) as rn
from employee

select *,
max(salary) over(partition by dept_name) as maximum_salary,
row_number() over(partition by dept_name order by dept_name) as rn
from employee;


select * from (
	select *,
	row_number() over(partition by dept_name order by dept_name) as rn
	from employee) new
where new.rn < 2;

--employees earning the highest salary
select * from(
	select *,
	max(salary) over(partition by dept_name) as maximum_salary,
	row_number() over(partition by dept_name order by salary desc) as rn
	from employee) as new
where new.rn < 2;


---rank
select *,
rank() over(partition by dept_name order by salary desc) as max_rank
from employee;


--dense rank
select *,
dense_rank() over(partition by dept_name order by salary desc) as dense_max_rank
from employee;


select *,
rank() over(partition by dept_name order by salary desc) as max_rank,
dense_rank() over(partition by dept_name order by salary desc) as dense_max_rank
from employee;


--lead = used to access a row below the current row(next, below)
--lag = used to access a row above the current row(previous, above)

--get a query to display if the salry of an employee is higher, lower or equal to the previous employee

select *, 
lag(salary) over(partition by dept_name order by emp_NAME) as prev_employee_salary
from employee;

select *, 
lead(salary) over(partition by dept_name order by emp_NAME) as below_employee_salary
from employee;

select *, 
lead(salary) over(partition by dept_name order by emp_NAME) as below_employee_salary,
lag(salary) over(partition by dept_name order by emp_NAME) as prev_employee_salary
from employee;







