CREATE TABLE PATIENTS_INFO(

   Patient_ID   INT  NOT NULL,

   Name VARCHAR (20) NOT NULL,

   Department  CHAR (25) ,

   Diagnosis  CHAR (25) ,

   Date_admitted  DATETIME,

   Date_discharged DATETIME,

   PRIMARY KEY (Patient_ID)

);


INSERT INTO PATIENTS_INFO VALUES(1 , 'John Oliver' , 'E&&R' , 'hand
injury' , '2022-05-13 16:03:43' , '2022-05-13 18:01:45')

INSERT INTO PATIENTS_INFO VALUES(2 , 'Meghan Austin' , 'E&R' , 'Flue'
, '2022-04-12 12:03:23' , '2022-04-12 13:04:35')

INSERT INTO PATIENTS_INFO VALUES(3 , ' Nick Hilson  ' , ' Cardiology'
, 'Heart issues' , '2022-04-01 10:01:43' , '2022-04-26 19:03:35')

INSERT INTO PATIENTS_INFO VALUES(4 , ' anna Daniel' , 'e&r' , 'flue' ,
'2022-05-12 11:03:43' , '2022-05-15 20:01:45')

INSERT INTO PATIENTS_INFO VALUES(5 , 'Emma James' , 'E&R' , 'Accident'
, '2022-03-29 15:02:52' , '2022-04-10 19:03:12')

select * from PATIENTS_INFO;

--Trim
select Name as real_name,
	trim(Name) as trimmed_name
from PATIENTS_INFO

UPDATE PATIENTS_INFO
SET Name = TRIM(Name)

select name from PATIENTS_INFO

--upper
select upper(diagnosis) as Upper_Case_Diagnosis
from PATIENTS_INFO

select upper(trim(diagnosis)) as Diagnosis_type
from PATIENTS_INFO

select upper(trim(diagnosis)) as Diagnosis_type,
COUNT(*) as count_of_diagnosis
from PATIENTS_INFO
Group by upper(trim(diagnosis));

--replace
select Department,replace(Department, '&&', '&') as Department2
From PATIENTS_INFO;

UPDATE PATIENTS_INFO
set Department=replace(department, '&&', '&')

select department
from PATIENTS_INFO

--substring
select department, SUBSTRING(department, 0, 5) as department_code
from PATIENTS_INFO

--left
select name, LEFT(department, 4) as department
from PATIENTS_INFO;


select GETDATE();

--datediff -- used to subtract two dates and get the number of days, hours, minutes, seconds between two dates

select *,
DATEDIFF(day, date_admitted, date_discharged) as number_of_days_admitted
from PATIENTS_INFO;

select *,
DATEDIFF(hour, date_admitted, date_discharged) as number_of_hours
from PATIENTS_INFO
where Department = 'E&R'

select AVG(DATEDIFF(day, date_admitted, date_discharged)) as average_no_of_days
from PATIENTS_INFO
where Department = 'E&R'
