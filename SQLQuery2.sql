create database sales;

use sales;

create table salesman(
	salesman_id int Primary key not null,
	name varchar(15),
	city varchar(15),
	commission decimal(4,2)
);

insert into salesman values (5001,'James Hoog','New York',0.15);
insert into salesman values (5002,'Nail Knite','Paris',0.13);
insert into salesman values (5003,'Lauson Hen','San Jose',0.12);
insert into salesman values (5005,'Pit Alex','London',0.11);
insert into salesman values (5006,'Mc Lyon','Paris',0.14);
insert into salesman values (5007,'Paul Adam','Rome',0.13);

select * from salesman;

create view salesview 
as 
select * from salesman where city='New York'

select * from salesview

create view salesperson_view
as
select * from salesman;

select salesman_id,name,city from salesperson_view


create view sale_count
as 
select city,count(distinct salesman_id) as SalesPerson_No from salesman group by(city)

select * from sale_count


--Customer Table--

create table customer(
	customer_id int Primary key not null,
	cust_name varchar(15),
	city varchar(15),
	grade int,
	salesman_id int foreign key references salesman(salesman_id) on delete cascade on update cascade
);


insert into customer values (3002, 'Nick Rimando', ' New York', 100, 5001);
insert into customer values (3007, 'Brad Davis' ,'New York',200,5001);
insert into customer values (3005,'Graham Zusi','California',200,5002);
insert into customer values (3008,'Julian Green','London',300,5002);
insert into customer values (3004,'Fabian Johnson','Paris',300,5006);
insert into customer values (3009,'Geoff Cameron','Berlin',100,5003);
insert into customer values (3003,'Jozy Altidor','Moscow',200,5007);
insert into customer values (3001,'John Smith','Moscow',100,5007);


select * from customer;

create view cust_view
as 
select grade, count(distinct customer_id) as No_Of_Customers from customer group by grade;

select * from cust_view;

--Orders Table--

create table orders(
order_no int,
purch_amt float(50),
ord_date Date,
customer_id int foreign key references customer(customer_id) on delete cascade on update cascade,
salesman_id int foreign key references salesman(salesman_id),
);


insert into orders values (70001,150.5,'2012-10-05',3005,5002);
insert into orders values (70009,270.65,'2012-09-10',3001,5005);
insert into orders values (70002,65.26,'2012-10-05',3002,5001);
insert into orders values (70004,110.5,'2012-08-17',3009,5003);
insert into orders values (70007,948.5,'2012-09-10',3005,5002);
insert into orders values (70005,2400.6,'2012-07-27',3007,5001);
insert into orders values (70008,5760,'2012-09-10',3002,5001);

Select * from orders

create view order_view
as 
select order_no,purch_amt,s.salesman_id,s.name as Salesperson,c.cust_name as Customer from orders as o,salesman as s, customer as c where
(o.customer_id = c.customer_id and
o.salesman_id = s.salesman_id);

select * from order_view;
