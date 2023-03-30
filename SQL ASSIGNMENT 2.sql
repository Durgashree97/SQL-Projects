create database EMPLOYEE_TABLE;
use EMPLOYEE_TABLE;

create table Employee(
Employee_id int Primary key,
First_name varchar(20),
Last_name varchar(20),
Salary int,
Joining_date datetime,
Department varchar(20)
);

select * from Employee;

insert into Employee values(1,'Anika','Arora', 100000, '2020-02-14 09:00:00','HR');
insert into Employee values(2,'Veena','Verma', 80000, '2011-06-15 09:00:00','Admin');
insert into Employee values(3,'Vishal','Singhal', 300000, '2020-02-16 09:00:00','HR');
insert into Employee values(4,'Sushanth','Singh', 500000, '2020-02-17 09:00:00','Admin');
insert into Employee values(5,'Bhupal','Bhati', 500000, '2011-06-18 09:00:00','Admin');
insert into Employee values(6,'Dheeraj','Diwan', 200000, '2011-06-19 09:00:00','Account');
insert into Employee values(7,'Karan','Kumar', 75000, '2020-01-14 09:00:00','Account');
insert into Employee values(8,'Chandrika','Chauhan', 90000, '2011-04-15 09:00:00','Admin');

select * from Employee

use EMPLOYEE_TABLE;

create table Employee_Bonus(
Employee_ref_id int,
foreign key(Employee_ref_id) references Employee(Employee_id),
Bonus_Amount int,
Bonus_Date datetime
);

select * from Employee_Bonus;

insert into Employee_Bonus values(1,5000,'2020-02-16 00:00:00');
insert into Employee_Bonus values(2,3000,'2011-06-16 00:00:00');
insert into Employee_Bonus values(3,4000,'2020-02-16 00:00:00');
insert into Employee_Bonus values(4,4500,'2020-02-16 00:00:00');
insert into Employee_Bonus values(5,3500,'2011-06-16 00:00:00');

select * from Employee_Bonus

use EMPLOYEE_TABLE;

create table Employee_title(
Employee_ref_id int,
Employee_title varchar(20),
Affective_Date datetime
);

insert into Employee_title values(1,'Manager','2016-02-20 00:00:00');
insert into Employee_title values(2,'Executive','2016-06-11 00:00:00');
insert into Employee_title values(8,'Executive','2016-06-11 00:00:00');
insert into Employee_title values(5,'Manager','2016-06-11 00:00:00');
insert into Employee_title values(4,'Asst.Manager','2016-06-11 00:00:00');
insert into Employee_title values(7,'Executive','2016-06-11 00:00:00');
insert into Employee_title values(6,'Lead','2016-06-11 00:00:00');
insert into Employee_title values(3,'Lead','2016-06-11 00:00:00');

select * from Employee_title;

use EMPLOYEE_TABLE;

select First_name as Employee_name from Employee;

select upper(Last_name) from Employee;

select distinct Department from Employee;

select substring(Last_name,1,3) from Employee;

select distinct Department from Employee ;

select CONCAT_WS(' ',First_name,Last_name) as Full_name from Employee;

select * from Employee order by First_name asc;

select * from Employee order by First_name asc, Department desc;

select First_name from Employee where First_name='Veena';

select * from Employee where Department='Admin'

select First_name from Employee where  First_name like 'V%';

select * from Employee where Salary between 100000 and 500000;

select * from Employee where Joining_date between '2020-02-28 09:00:00' and '2020-02-01 09:00:00';

SELECT * from Employee where Joining_date between ('2020-02-01 09:00:00' ) and ('2020-02-28 09:00:00');

select * from Employee where Salary>=50000 and Salary<=100000;

select * from Employee Right join Employee_title on Employee. First_name=Employee_title.Employee_title;

select First_name, MIN(Salary) from Employee group by First_name having MIN(Salary)>100000;

select * from Employee where Employee_id%2=1;

select top(2) Salary from Employee order by Salary desc;

select * into copy_of_Employee from Employee;

select * from copy_of_Employee;

select * from Employee join Employee_title on Employee.Salary=Employee_title.Employee_ref_id;

select * from Employee group by Salary order by Salary desc limit 2,1;

select top 50 percent * from Employee;

select * from Employee where Department in (select Department from Employee group by Department having COUNT(*)<4);

select Department, count(*) from Employee group by Department;

select * from Employee  where Salary in (select MAX(Salary) from Employee group by Department);

select First_name, Last_name from Employee  where Salary in (select MAX(Salary) from Employee);

select AVG(Salary) from Employee group by Department;

select * from Employee, Employee_Bonus where Employee_id=Employee_ref_id and
Bonus_Amount=(select MAX(bonus_amount) from Employee_Bonus);

select first_name, Employee_title from Employee,Employee_title where Employee_id=Employee_ref_id;


