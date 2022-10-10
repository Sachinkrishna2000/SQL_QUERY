CREATE DATABASE ORG;



USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR (25),
	SALARY INT ,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR (25)
);


INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '12-02-2020', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '12-06-2011', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '12-02-2020', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '12-02-2020', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '12-06-2011', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '12-06-2011', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '12-01-2020', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '12-04-2011', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '12-02-2020'),
		(002, 3000, '12-06-2011'),
		(003, 4000, '12-02-2020'),
		(001, 4500, '12-02-2020'),
		(002, 3500, '12-06-2011');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20'),
 (002, 'Executive', '2016-06-11'),
 (008, 'Executive', '2016-06-11'),
 (005, 'Manager', '2016-06-11'),
 (004, 'Asst. Manager', '2016-06-11'),
 (007, 'Executive', '2016-06-11'),
 (006, 'Lead', '2016-06-11'),
 (003, 'Lead', '2016-06-11');

select * from Worker;

select * from Bonus;

select * from Title;

select FIRST_NAME as WORKER_NAME from Worker;

select UPPER(FIRST_NAME) from Worker;

select DISTINCT(DEPARTMENT) from Worker;

select substring(FIRST_NAME,1,3) from Worker;

select distinct len(DEPARTMENT) from Worker;

select CONCAT(FIRST_NAME,' ',LAST_NAME) as COMPLETE_NAME from Worker;

select * from Worker where FIRST_NAME in ('VIPUL','SATISH');

select * from Worker where DEPARTMENT='Admin';

select * from Worker where FIRST_NAME like '%a';

select * from Worker where FIRST_NAME like '%a%';