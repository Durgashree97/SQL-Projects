/*SIMPLE QUERIES*/
use CASE_STUDY;

select * from Employee;

select * from DEPARTMENT;

select * from JOB;

select * from LOCATION_;

select First_Name, Last_Name, Salary, Commision from Employee;

select Employee_Id,Last_Name,Department_Id from Employee;

select Employee_Id as 'ID OF THE EMPLOYEE' from Employee;

select Last_Name as 'NAME OF THE EMPLOYEE' from Employee;

select Department_Id as 'DEP_ID' from Employee;

select First_Name,Last_name,salary from Employee;

/*WHERE CONDITION*/

select * from Employee where Last_Name='SMITH';

select * from Employee where Department_Id =20;

select * from Employee where Salary between 3000 and 4500; 

select * from Employee where Department_Id = 10 or Department_Id= 20;

select * from Employee where Department_Id != 10 or Department_Id!=20;

select * from Employee where Last_Name like 'S%';

select * from Employee where Last_Name like 'S%H';

select * from Employee where Last_Name like 'S__%';

select * from Employee where Department_Id=10 and Salary>3500;

select Commision from Employee where Commision isNULL;

/*ORDER BY CLAUSE*/

select Employee_Id,Last_Name from Employee order by Employee_Id asc;

select Employee_Id,Last_Name from Employee order by salary desc;

select * from Employee order by Last_Name asc;

select * from Employee order by Last_Name asc, Department_Id desc;

/*GROUP BY AND HAVING CLAUSE*/

SELECT Department_Id, COUNT(*) as Count_ FROM Employee GROUP BY Department_Id;

select MAX(Salary) as Max_, MIN(Salary) as Min_, AVG(Salary)as Avg_ from Employee group by Department_Id ;

select  MAX(Salary) as Max_, MIN(Salary) as Min_, AVG(Salary)as Avg_ from Employee 
inner join JOB on Employee.Job_ID=JOB.Job_ID group by Salary ;

select COUNT(*) from Employee group by Hire_Date order by Hire_Date asc;

*****
select Department_Id, COUNT(*) from Employee group by Department_Id having COUNT(*)>=4 ;

select Hire_Date, COUNT(*) from Employee group by Hire_Date having MONTH(Hire_Date)=1;

select Hire_Date, COUNT(*) from Employee group by Hire_Date having MONTH(Hire_Date) between 1 and 9;

select Hire_Date, COUNT(*) from Employee group by Hire_Date having YEAR(Hire_Date) =1985;

select Hire_Date, COUNT(*) from Employee  where YEAR(Hire_Date) =1985 and MONTH(Hire_Date)=03 group by Hire_Date;

select First_Name, COUNT(Hire_Date) from Employee  where YEAR(Hire_Date) =1985 and MONTH(Hire_Date) between 01 and 12 group by First_Name;

select Department_Id from Employee where YEAR(Hire_Date)=1985 and MONTH(Hire_Date)=04 group by Department_Id having COUNT(*)>3;





/*JOINS*/
select First_Name,Last_Name,Name_ ,Salary from Employee inner join DEPARTMENT on Employee.Department_Id=DEPARTMENT.Department_Id; 

select First_Name, Middle_Name,Last_Name,Designation from Employee inner join JOB on Employee.Job_ID=JOB.Job_ID; 

select First_Name, Middle_Name,Last_Name,Designation,Name_ from Employee inner join JOB on Employee.Job_ID=JOB.Job_ID 
inner join DEPARTMENT on Employee.Department_Id=DEPARTMENT.Department_Id;

select First_Name,Last_Name,Name_ ,Salary,COUNT(*) from Employee inner join DEPARTMENT 
on Employee.Department_Id=DEPARTMENT.Department_Id group by First_Name,Last_Name,Name_ ,Salary;

select Name_ ,COUNT(*) from Employee inner join DEPARTMENT 
on Employee.Department_Id=DEPARTMENT.Department_Id group by Name_ ;   

select Designation,count(*) from JOB inner join Employee 
on JOB.Designation=Employee.Department_Id group by Designation; 

select City,count(*) from LOCATION_ inner join DEPARTMENT on LOCATION_.Location_ID=DEPARTMENT.Location_ID 
inner join Employee on DEPARTMENT.Department_Id=Employee.Department_Id group by City;
 
select Name_, COUNT(*) from DEPARTMENT inner join Employee on DEPARTMENT.Department_Id=Employee.Department_Id
where Salary between 2000 and 5000 group by Name_;

select First_Name,Middle_Name,Last_Name,Salary,* from Employee inner join JOB 
on Employee.Job_ID=JOB.Job_ID order by Employee.Salary;

select *,* from Employee e inner join Employee m on e.Manager_Id=m.Manager_Id;

select * from Employee e, Employee m where e.Manager_Id=m.Manager_Id and e.Salary>m.Salary;

select COUNT(*) from Employee e inner join Employee m on e.Manager_Id=m.Manager_Id group by e.Manager_Id;

select e.Employee_Id,e.First_Name,e.Last_Name,m.Manager_Id from Employee e inner join Employee m on e.Manager_Id=m.Manager_Id;

select First_Name,Last_Name,Name_ from Employee right join DEPARTMENT 
on Employee.Department_Id=DEPARTMENT.Department_Id;

/*SET OPERATIONS*/

select count(distinct Name_) from Employee inner join DEPARTMENT 
on Employee.Department_Id=DEPARTMENT.Department_Id group by Name_;

select Designation from JOB union all select Name_ from DEPARTMENT;

select Name_,First_Name,Designation from DEPARTMENT inner join Employee on DEPARTMENT.Department_Id=Employee.Department_Id
inner join JOB on Employee.Job_ID=JOB.Job_ID;

/*SUB QUERIES*/

select First_Name,MAX(Salary) from Employee where Salary=(select MAX(Salary) from Employee) 
group by First_Name;

select * from Employee where Department_Id in (select Name_ from DEPARTMENT where Name_='Sales');

select First_Name,Last_Name from Employee where Job_ID in(select Designation from JOB where Designation='Clerk');

select First_Name from Employee inner join DEPARTMENT on Employee.Department_Id=DEPARTMENT.Department_Id
where Location_Id in (select City from LOCATION_ where City='New York');

select COUNT(*) from Employee where Department_Id in (select Department_Id from DEPARTMENT where Name_='Sales');

update Employee set Salary=Salary+10% (select Job_ID from JOB where Designation='Clerk');

delete from Employee where Department_Id in (select Department_Id from DEPARTMENT where Name_='Accounting');

select * from Employee where Salary  <> (select max(Salary) from Employee) 
order by Salary desc OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY; 

select * from Employee where Salary = (select MIN(Salary) from Employee where Salary in 
(select distinct top 1 Salary from Employee order by Salary desc));














