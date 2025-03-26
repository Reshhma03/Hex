create database subquery;
use subquery;

--q1
create table salesman (
	salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4,2)
);

insert into salesman (salesman_id, name, city, commission) 
values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

create table Orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);


insert into Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

select ord_no,purch_amt,ord_date,customer_id from Orders
where salesman_id=
	(select salesman_id from salesman where name='Paul Adam');

--q2
select ord_no,purch_amt,ord_date,customer_id ,salesman_id from Orders
where salesman_id=
	(select salesman_id from salesman where city='London');

--q3
select ord_no,purch_amt,ord_date,customer_id ,salesman_id from Orders
where salesman_id=
	(select salesman_id from Orders where customer_id=3007);
--q4
select ord_no,purch_amt,ord_date,customer_id ,salesman_id from Orders
where salesman_id in
	(select distinct salesman_id from Orders where ord_date='2012-10-10');

--q5
select ord_no, purch_amt, ord_date, customer_id, salesman_id
from Orders
where salesman_id in
	(select salesman_id from Salesman where city = 'New York');

--q6
create table Customer_1 (
    customer_id INT,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);

insert into Customer_1 (customer_id, cust_name, city, grade, salesman_id)
values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moncow', 200, 5007);

select Commission from Salesman
where city='Paris';

--q7
select customer_id, cust_name from Customer_1
where customer_id < 2001 
and salesman_id = (select salesman_id from Salesman where name = 'Mc Lyon');

--q8
select grade, count(*) as Totalcount from Customer_1
where city = 'New York' and grade > (select AVG(grade) from Customer where city = 'New York')
group by grade;

--q9
select ord_no, purch_amt, ord_date, salesman_id
from orders
where salesman_id = (select salesman_id from salesman where commission = (select max(commission) from salesman));

--q10
select * from orders o, Customer_1 c 
where o.customer_id = c.customer_id and o.ord_date = '2012-08-17';
go

--q11
select salesman_id, name
from salesman
where salesman_id in (select salesman_id from Customer_1
                      group by salesman_id
                      having count(customer_id) > 1);

--q12
select ord_no, purch_amt, ord_date, customer_id, salesman_id
from orders
where purch_amt > (select avg(purch_amt) from orders);

--q13
select ord_no, purch_amt, ord_date, customer_id, salesman_id
from orders
where purch_amt >= (select avg(purch_amt) from orders);

--q14

select ord_date, sum(purch_amt) as total_amount from orders
group by ord_date
having sum(purch_amt) > (select max(purch_amt) + 1000 from orders o where ord_date = o.ord_date);
go
--q15
if exists (select 1 from Customer_1 where city = 'london')
select * from customer_1;

--q16
select s.salesman_id, s.name, s.city, s.commission
from salesman s, Customer_1 c where s.salesman_id = c.salesman_id
group by s.salesman_id, s.name, s.city, s.commission
having count(c.customer_id) > 1;

--q17
select s.salesman_id, s.name, s.city, s.commission
from salesman s, customer_1 c where s.salesman_id = c.salesman_id
group by s.salesman_id, s.name, s.city, s.commission
having count(c.customer_id) = 1;

--q18
select s.salesman_id, s.name, s.city, s.commission
from salesman s, Customer_1 c, orders o 
where s.salesman_id = c.salesman_id and c.customer_id = o.customer_id
group by s.salesman_id, s.name, s.city, s.commission
having count(o.ord_no) > 1;

--q19
select distinct s.salesman_id, s.name, s.city, s.commission
from salesman s
where s.city in (select distinct city from Customer_1);
go
--q20
select s.salesman_id, s.name, s.city, s.commission
from salesman s
where exists (
    select * from customer_1 c
    where c.city = s.city and c.salesman_id = s.salesman_id);

--q21
select s.salesman_id, s.name, s.city, s.commission
from salesman s, customer_1 c 
where s.salesman_id = c.salesman_id and s.name < c.cust_name;

--q22
select c.customer_id, c.cust_name, c.city, c.grade, c.salesman_id
from customer_1 c
where c.grade > (select max(grade) from customer_1 where city < 'new york');

--q23
select o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
from orders o
where o.purch_amt > any (select purch_amt from orders where ord_date = '2012-09-10');

--q24
select o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
from orders o
where o.purch_amt < any (select purch_amt from orders o2, customer_1 c
                         where o2.customer_id = c.customer_id and c.city = 'london');

--q25
select o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
from orders o
where o.purch_amt < (select max(purch_amt) from orders o, customer_1 c 
                     where  o.customer_id = c.customer_id and c.city = 'london');

--q26
select c.customer_id, c.cust_name, c.city, c.grade, c.salesman_id
from customer_1 c
where c.grade > (select max(grade) from customer_1
                 where city = 'new york');

--q27
select s.name, s.city, sum(o.purch_amt) as total_order_amount
from salesman s, orders o, customer_1 c 
where s.salesman_id = o.salesman_id and o.customer_id = c.customer_id and s.city = c.city
group by s.name, s.city;

--q28
select c.customer_id, c.cust_name, c.city, c.grade, c.salesman_id
from customer_1 c
where c.grade not in (select grade from customer_1 where city = 'london');

--q29
select c.customer_id, c.cust_name, c.city, c.grade, c.salesman_id
from customer_1 c
where c.grade not in(select grade from customer_1 where city = 'paris');

--q30
select c.customer_id, c.cust_name, c.city, c.grade, c.salesman_id
from customer_1 c
where c.grade not in (select grade from customer_1 where city = 'dallas');



create table company_mast (
    com_id int,
    com_name varchar(50)
);

insert into company_mast (com_id, com_name)
values
(11, 'samsung'),
(12, 'iball'),
(13, 'epsion'),
(14, 'zebronics'),
(15, 'asus'),
(16, 'frontech');


create table item_mast (
    pro_id int,
    pro_name varchar(50),
    pro_price decimal(10, 2),
    pro_com int
);

insert into item_mast (pro_id, pro_name, pro_price, pro_com)
values
(101, 'mother board', 3200.00, 15),
(102, 'key board', 450.00, 16),
(103, 'zip drive', 250.00, 14),
(104, 'speaker', 550.00, 16),
(105, 'monitor', 5000.00, 11),
(106, 'dvd drive', 900.00, 12),
(107, 'cd drive', 800.00, 12),
(108, 'printer', 2600.00, 13),
(109, 'refill cartridge', 350.00, 13),
(110, 'mouse', 250.00, 12);


create table emp_details (
    emp_idno int,
    emp_fname varchar(50),
    emp_lname varchar(50),
    emp_dept int
);

insert into emp_details (emp_idno, emp_fname, emp_lname, emp_dept)
values
(127323, 'michale', 'robbin', 57),
(526689, 'carlos', 'snares', 63),
(843795, 'enric', 'dosio', 57),
(328717, 'jhon', 'snares', 63),
(444527, 'joseph', 'dosni', 47),
(659831, 'zanifer', 'emily', 47),
(847674, 'kuleswar', 'sitaraman', 57),
(748681, 'henrey', 'gabriel', 47),
(555935, 'alex', 'manuel', 57),
(539569, 'george', 'mardy', 27),
(733843, 'mario', 'saule', 63),
(631548, 'alan', 'snappy', 27),
(839139, 'maria', 'foster', 57);


create table emp_department (
    dpt_code int,
    dpt_name varchar(50),
    dpt_allotment int
);

insert into emp_department (dpt_code, dpt_name, dpt_allotment)
values
(57, 'it', 65000),
(63, 'finance', 15000),
(47, 'hr', 240000),
(27, 'rd', 55000),
(89, 'qc', 75000);
go

--q31
select cm.com_name as company, avg(im.pro_price) as average_price
from item_mast im, company_mast cm 
where im.pro_com = cm.com_id
group by cm.com_name;

--q32
select cm.com_name as company, avg(im.pro_price) as average_price
from item_mast im, company_mast cm 
where im.pro_com = cm.com_id and im.pro_price >= 350
group by cm.com_name;

--q33
select cm.com_name as company, im.pro_name as product_name, max(im.pro_price) as price
from item_mast im, company_mast cm 
where im.pro_com = cm.com_id
group by cm.com_name, im.pro_name;

--q34
select emp_idno, emp_fname, emp_lname, emp_dept
from emp_details
where emp_lname in ('gabriel', 'dosio');

--q35
select emp_idno, emp_fname, emp_lname, emp_dept
from emp_details
where emp_dept in (89, 63);

--q36
select ed.emp_fname, ed.emp_lname
from emp_details ed, emp_department edpt 
where ed.emp_dept = edpt.dpt_code and edpt.dpt_allotment > 50000;

--q37
select dpt_code, dpt_name, dpt_allotment
from emp_department
where dpt_allotment > (select avg(dpt_allotment) from emp_department);

--q38
select edpt.dpt_name
from emp_details ed, emp_department edpt  
where ed.emp_dept = edpt.dpt_code
group by edpt.dpt_name
having count(ed.emp_idno) > 2;


--q39
select ed.emp_fname, ed.emp_lname
from emp_details ed, emp_department edpt 
where ed.emp_dept = edpt.dpt_code
and edpt.dpt_allotment = (
    select min(dpt_allotment)
    from emp_department
    where dpt_allotment > (
        select min(dpt_allotment) from emp_department));

