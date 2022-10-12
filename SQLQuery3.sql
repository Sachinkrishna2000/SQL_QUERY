use functions;

create table Employee(
	EID int NOT NULL PRIMARY KEY,
	EName varchar(20) NOT NULL,
	EDesignation varchar(20),
	EAge int
);

create table demo(
	TID int,
	TName varchar(20),
	DOJ Datetime
);
select * from Employee;

select * from demo;

create function Fn_Add(@a int, @b int)
returns int
as
begin
	return @a + @b
end

select dbo.Fn_Add(4,4) as Result

create procedure Employee_Count(@totalemp int OUTPUT)
as
Begin
	Select @totalemp=count(EID) from Employee
End

--execute the procedure with ouput parameter
--execute the below three lines at once
Declare @Result int
exec Employee_Count @Result OUTPUT --OUPUT is mandatory
Print @Result

create trigger trg_demo_dml --trigger name
on demo -- table name
FOR INSERT, UPDATE, DELETE
as
begin
	if (DATEPART(HH,GETDATE())>18 OR DATEPART(HH,GETDATE())<10)
	BEGIN
		print 'You cannot insert into the demo table after 6:00PM and before 10:00AM'
		Rollback transaction -- like the working of ctrl+z
	END
end

update demo set TName='James' where TID=122
insert into demo values(108,'Lisa','2022-07-06')
delete from demo where TID=116


create trigger trg_DDL_AllDB
on ALL Server
For Create_Table,Alter_Table,Drop_Table
as
Begin
	Print 'You cannot perform DDL on any Database'
	Rollback Transaction
End

--Change to another database
use dotnet

create table demo4
(
id int
)

--Change to another database
use sales

create table demo1
(
Tid int NOT NULL Primary Key,
TName varchar(25)
);


Disable trigger trg_DDL_AllDB on ALL Server

select * from demo1


-- SAVEPOINT - SAVE TRANSACTION
BEGIN TRANSACTION
	insert into demo1 values(7,'Anna');
	--SAVEPOINT
	SAVE TRANSACTION insert_stmt
	delete from demo1 where TID=4;
	ROLLBACK TRANSACTION insert_stmt
COMMIT TRANSACTION

create procedure sp_DivideByZeroTryCatch
as
BEGIN
	select EDesignation,count(EAge) as Total_Emp_Designation from Employee Group By EDesignation
end

alter procedure sp_DivideByZeroTryCatch
@num1 int,
@num2 int
as
BEGIN	
	Declare @Result int
	SET @Result = 0
	BEGIN TRY
		BEGIN
			IF(@num2=0)
			RAISERROR('Cannot Divide By Zero',16,127) -- We can either use ERROR_NUMBER() or ERROR_MESSAGE()
			--THROW 50001,'Cannot Divide By Zero',1 -- ERROR_NUMBER() & ERROR_MESSAGE() & ERROR_STATE() & ERROR_SEVERITY() is 16 by default
			SET @Result=@num1/@num2
			PRINT 'Value is:' + CAST(@Result as varchar)
		END
	END TRY
	BEGIN CATCH
		PRINT ERROR_NUMBER()
		PRINT ERROR_MESSAGE()
		PRINT ERROR_SEVERITY()
		PRINT ERROR_STATE()		
	END CATCH
END

execute sp_DivideByZeroTryCatch 10,10 --Value is:1

execute sp_DivideByZeroTryCatch 10,0
--50000 ERROR_NUMBER() - default
--Cannot Divide By Zero
--16
--127