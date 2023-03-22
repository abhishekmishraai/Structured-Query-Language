create table if not exists employeeinfo1 (
EmpID integer unique,
EmpFname varchar(50),
EmpLname varchar(50),
Department varchar(30),
project varchar(20),
address varchar(30),
DOB timestamp,
Gender varchar(5)
);

insert into employeeinfo1 values
(1,'sanjay','mehra','HR','P1','Hyderabad(HYD)','01/12/1976','M'),
(2,'ananya','mishra','admin','P2','Delhi(DEL)','02/05/1968','F'),
(3,'rohan','diwan','Account','P3','Mumbai(BOM)','01/01/1980','M'),
(4,'sonia','kulkarni','HR','P1','Hyderabad(HYD)','02/05/1992','F'),
(5,'ankit','kapoor','Admin','P2','Delhi(DEL)','03/07/1994','M');

create table if not exists employeeposition (
EmpID integer,
EmpPosition varchar(50),
DateOfJoining timestamp,
salary integer
);

insert into employeeposition values
(1,'Manager','01/05/2022',500000),
(2,'Executive','02/05/2022',75000),
(3,'Manager','01/05/2022',90000),
(2,'Lead','02/05/2022',85000),
(1,'Executive','01/05/2022',300000);


--1)Write a query to fetch the EmpFname from the EmployeeInfo table inupper case and use the ALIAS name as EmpName.

select upper(EmpFname||' '||EmpLname)as EmpName from employeeinfo1

--2)Write a query to fetch the number of employees working in the department ‘HR’
select count(*) from employeeinfo1
where Department = 'HR'

--3)Write a query to get the current date. 

SELECT CURRENT_TIMESTAMP

--4)Write a query to retrieve the first four characters of EmpLname from the EmployeeInfo table.

select substring(EmpFname,1,4) from employeeinfo1

--5)Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.

select substring(address,1,position('(' in address)-1) as add_ress from employeeinfo1

--6)Write a query to create a new table which consists of data and structure copied from the other table.

create table new_table as (select * from employeeinfo1)

select * from new_table

--7)Write a query to find all the employees whose salary is between 50000 to 100000.

select * 
from employeeinfo1 e
join employeeposition p on e.empid = p.empid
where salary BETWEEN  50000 and 100000

--8)Write a query to find the names of employees that begin with ‘S’

select * 
from employeeinfo1
where empfname like 's%'

--9)Write a query to fetch top N records.

select *
from employeeinfo1
order by empfname asc 
limit 3

--10)Write a query to retrieve the EmpFname and EmpLname in a singlecolumn as “FullName”. 
--The first name and the last name must be separated with space.

select (EmpFname||' '||EmpLname)as EmpName from employeeinfo1 

--11)Write a query find number of employees whose DOB is between 02/05/1970 to 10/12/1994 
--and are grouped according to gender

select gender, count(*)
from employeeinfo1
where dob between '02/05/1970' and '10/12/1994'
group by gender 

--12)Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname
--in descending order and Department in the ascending order.

select * 
from EmployeeInfo1
order by  EmpLname desc, Department asc

--13)Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ 
--and contains five alphabets.

select EmpLname
from EmployeeInfo1
where EmpLname like '____a'

--Q16. Write a query to fetch all employees who also hold the managerial position.

select *
from EmployeeInfo1 e
join employeeposition p on e.empid = p.empid
where p.empposition = 'Manager'


--17)Write a query to fetch the department-wise count of employees sortedby department’s count in ascending order.

select department, count(*) as dep
from EmployeeInfo1
group by department
order by dep asc

----Q18. Write a query to calculate the even and odd records from a table.

-- even id
select count(*) as even_id
from (select empid 
	from employeeinfo1
	where empid % 2 =0) as p

-- odd id
select count(*) as even_id
from (select empid 
	from employeeinfo1
	where empid % 2 !=0) as p

---Q19. Write a SQL query to retrieve employee details from EmployeeInfo table 
--who have a date of joining in the EmployeePosition table.
select * 
from employeeinfo1
where empid in (select p.empid
		from employeeposition p
		join EmployeeInfo1 e on e.empid = p.empid)

--20)Write a query to fetch 50% records from the EmployeeInfo table
select * 
from EmployeeInfo1
where empid > (select count(empid)/2 from EmployeeInfo1)

--21)Write a query to retrieve EmpPostion along with total salaries paid for each of them.

select empposition, sum(salary) as total_salary
from employeeposition
group by empposition

--22)Write a query to retrieve Departments who have less than 2 employees working in it.

select department, count(*)
from EmployeeInfo1
group by department
having count(*)<2

--23)Write a query to display the first and the last record from the EmployeeInfo table.
select *
from EmployeeInfo1
where empid = (select min(empid) from EmployeeInfo1) AND
empid = (select max(empid) from EmployeeInfo1)

---Write a query to find the third-highest salary from the EmpPosition table.
create view kam as (
select empposition,sum(salary) as total
from employeeposition
group by empposition
order by total desc
limit 3)

select min(total) from kam




                                   --Practice Questions Part-2


                                   

create table employeeinfo (
empid integer,
empFname varchar(20),
empLname varchar (20),
department varchar (20),
salary integer
)

insert into employeeinfo values
(2,'rohit','sharma','Admin',75000)

(1,'karan','mehta','HR',300000),
(2,'rohit','sharma','Admin',75000),
(3,'ankush','rajput','Account',60000),
(4,'priyanshi','sharma','HR',500000),
(5,'sanket','gupta','Developer',100000),
(6,'shruti','kapoor','Admin',80000),

select * from employeeinfo


--write a query to find 3rd highest salary from the table.

select * 
from employeeinfo
order by salary desc
offset 2 rows fetch next 1 rows only;

--Find duplicate




--calculate even and odd records from the table

select * from employeeinfo
where empid % 2 = 0

select * from employeeinfo
where empid % 2 != 0

--first and last records from the table

select * 
from employeeinfo
where empid in ((select min(empid) from employeeinfo),
		(select max(empid) from employeeinfo
		))



--creating new table using the existing table
create table abc as 
(select salary from employeeinfo)

select * from abc



                                        --Practice Questions PART-3



create table employee1 (
empid integer unique,
empname varchar (20),
managerid integer,
deptid integer,
salary integer
);


insert into employee1 values
(3,'sourav',5,1,10000),(8,'sourav',5,1,10000),
(1,'sachin',3,1,6000),
(2,'rahul',3,1,7000),
(4,'kapil',5,1,8000),
(5,'gavaskar',0,1,9000),
(6,'mohit',7,2,6000),
(7,'paras',0,2,8000);

select * from employee1


drop table department

create table department (
deptid integer unique,
deptname varchar (20)
);

insert into department values (1, 'IT'),
(2,'Admin');

select * from department


--1. find duplicate records in a table

select empname
from employee1
group by empname, deptid
having count(empname)>1

--2.Delete all the duplicate records in a table
delete from employee1
where empid in (select max(empid) 
		from employee1
		group by  empname
		having count(empname)>1
		)

select * from employee1

--Find the manager name for the employee where empid and managerid are in the same table

select e.empid,p.managerid, e.empname
from employee1 e
left join employee1 p on p.empid = e.managerid

--Find the second highest salary

select *
from employee1
order by salary desc
offset 1 rows fetch next 1 rows only;


--Find maximum salary from each department.
select deptid,max(salary)
from employee1
group by  deptid

select * from(
select *, row_number() over(partition by deptid order by salary desc)as rn
from employee1) as e
where e.rn = 1



