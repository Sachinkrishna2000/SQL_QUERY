create database task;

use task;
use functions;

create synonym emp for Employee

select * from emp
select * from Employee

--synonyms - where they get stored in SQL Server
Select * from sys.synonyms 


-- 1.Simple View
select * from Employee

select * from demo1

create view Emp_View
as
select * from Employee where EDesignation='Trainee'

--Retrieve the view
select * from Emp_View

--insert into a simple view - will automatically reflect the changes in the original table
insert into Emp_View values(11,'Mike','Trainee',25)

--update in a simple view
update Emp_View set EAge=24 where EID=11

--delete in a simple view
delete from Emp_View where EID=11

--2. Complex View

--Result of 2 tables - using join clause
select e.EID,e.EName,e.EDesignation,d.Tid,d.TName
from Employee as e inner join demo1 as d on d.tid=e.EID;

create view Emp_Demo
as
select e.EID,e.EName,e.EDesignation,d.Tid,d.TName
from Employee as e inner join demo1 as d on d.tid=e.EID;

select * from Emp_Demo


--insert in a complex view
insert into Emp_Demo values(6,'Steve','Trainee',8,'Tony')--View or function 'Student_Dep' is not updatable because the modification affects multiple base tables.

--update in a complex view
update Emp_demo set EName='TChalla' where EID=5

--delete in a complex view
delete from Emp_Demo where EID=5--View or function 'Student_Dep' is not updatable because the modification affects multiple base tables.

--Sequence

create table demo3
(
TID int,
TName varchar(20)
)

create sequence TraineeID as int start with 100 increment by 2

insert into demo3 values(NEXT VALUE FOR TraineeID,'John')
insert into demo3 values(NEXT VALUE FOR TraineeID,'Sam')
insert into demo3 values(NEXT VALUE FOR TraineeID,'Paul')
insert into demo3 values(NEXT VALUE FOR TraineeID,'James')

select * from demo3

create table demo4
(
TID int,
TName varchar(20)
)

insert into demo4 values(NEXT VALUE FOR TraineeID,'John')
insert into demo4 values(NEXT VALUE FOR TraineeID,'Sam')
insert into demo4 values(NEXT VALUE FOR TraineeID,'Paul')
insert into demo4 values(NEXT VALUE FOR TraineeID,'James')

select * from demo3
select * from demo4

--TRUNCATE
truncate table demo4

--ALTER THE SEQUENCE AND RESET THE VALUE
alter sequence TraineeID restart with 1000 increment by 1

--drop sequence
drop sequence TraineeID

--create a clustered index on demo table
create clustered index ind_TID on demo(TID)

--create a non clustered index on demo table
create index ind_TName on demo(TName)

select * from demo
select * from Employee

--String FUnctions

select UPPER(TName) from demo3;

select substring(TName,1,3) from demo3;

select distinct len(TID) from demo3;

select CONCAT(TID,' ',TName) as COMPLETE_Name_Id from demo3;

--math Functions

--MIN() Function--Returns minimum value among two values
select Min(EAge) as MinAge from Employee

--MAX() Function--Returns maximum value among two values
Select MAX(EAge) as MaxAge from Employee

--Power Function--Returns the value of a number raised to the power of another number
SELECT POWER(5, 2);

--SUM() Function--Returns summation of a value
SELECT SUM(EAge) as Age_Sum from Employee;

--COUNT() Function--Returns count of a value
SELECT COUNT(EID) as count_emp from Employee;

select SQRT(4)

--

--Date Functions

--CURRENT_TIMESTAMP--Returns the current date and time
SELECT CURRENT_TIMESTAMP;

--DATEDIFF function--Returns the difference between two dates
SELECT DATEDIFF(year, '2011/02/13', '2001/02/13') AS Date;

--Month() Function--Return the month part of a date:
SELECT MONTH('2011/02/13') AS Month;





--Filtered index
create index ind_EDes on Employee(EDesignation) where EDesignation='Trainee'

select * from Employee where EDesignation='Trainee'