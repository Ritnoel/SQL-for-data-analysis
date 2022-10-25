create table emp
( emp_ID int
, emp_NAME varchar(50)
, SALARY int);

insert into emp values(101, 'Mohan', 40000);
insert into emp values(102, 'James', 50000);
insert into emp values(103, 'Robin', 60000);
insert into emp values(104, 'Carol', 70000);
insert into emp values(105, 'Alice', 80000);
insert into emp values(106, 'Jimmy', 90000);

create table sales
(
store_id int,
store_name varchar(50),
product varchar(50),
quantity int,
cost int
);

insert into sales values
(1, 'Apple Originals 1','iPhone 12 Pro', 1, 1000),
(1, 'Apple Originals 1','MacBook pro 13', 3, 2000),
(1, 'Apple Originals 1','AirPods Pro', 2, 280),
(2, 'Apple Originals 2','iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3','iPhone 12 Pro', 1, 1000),
(3, 'Apple Originals 3','MacBook pro 13', 1, 2000),
(3, 'Apple Originals 3','MacBook Air', 4, 1100),
(3, 'Apple Originals 3','iPhone 12', 2, 1000),
(3, 'Apple Originals 3','AirPods Pro', 3, 280),
(4, 'Apple Originals 4','iPhone 12 Pro', 2, 1000),
(4, 'Apple Originals 4','MacBook pro 13', 1, 2500);




select * from sales


--find total_sales per each store
select store_name, sum(cost) as total_sales_per_store
from sales
group by store_name;


--find the average sales with respect to all stores
select cast(avg(total_sales_per_store) as int) as total_average_all_store
from (select s.store_name, sum(s.cost) as total_sales_per_store
		from sales s
		group by store_name) x;


--find stores who's sale where better than the average sales across all the store

select *
from (select store_name, sum(cost) as total_sales_per_store
		from sales
		group by store_name) as total_sales
join (select cast(avg(total_sales_per_store) as int) as total_average_all_store
		from (select s.store_name, sum(s.cost) as total_sales_per_store
		from sales s
		group by store_name) x) as avg_sale
on total_sales.total_sales_per_store > avg_sale.total_average_all_store;


--doing it with the with clause

With total_sales as
	(select store_name, sum(cost) as total_sales_per_store
	from sales
	group by store_name),
	avg_sales as
	(select cast(avg(total_sales_per_store) as int) as total_average_all_store
	from total_sales)
select *
from total_sales
join avg_sales
on total_sales.total_sales_per_store > avg_sales.total_average_all_store;
	


