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

select * from employeeinfo1


insert into employeeinfo1 values
(1,'sanjay','mehra','HR','P1','Hyderabad(HYD)','01/12/1976','M'),
(2,'ananya','mishra','admin','P2','Delhi(DEL)','02/05/1968','F'),
(3,'rohan','diwan','Account','P3','Mumbai(BOM)','01/01/1980','M'),
(4,'sonia','kulkarni','HR','P1','Hyderabad(HYD)','02/05/1992','F'),
(5,'ankit','kapoor','Admin','P2','Delhi(DEL)','03/07/1994','M');

select * from employeeinfo1

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

select * from employeeposition

--1)Write a query to fetch the EmpFname from the EmployeeInfo table in upper 
--case and use the ALIAS name as EmpName.

select upper(empfname||' '||emplname) as full_name from employeeinfo1

select concat(empfname,emplname) as full_name from employeeinfo1

select concat(empfname,' ',emplname) as full_name from employeeinfo1

select upper(concat(empfname,' ',emplname)) as full_name from employeeinfo1

--2)Write a query to fetch the number of employees working in the department ‘HR’

select department,count(department) from employeeinfo1
group by department
having department = 'HR'


select count(department) from employeeinfo1
where department = 'HR'

--3)Write a query to get the current date. 

select current_timestamp

--4)Write a query to retrieve the first four characters of EmpLname from 
--the EmployeeInfo table.

select * from employeeinfo1

select trim(emplname,'a') from employeeinfo1

select left(emplname,4) from employeeinfo1


--4)Write a query to retrieve the last four characters of EmpLname from 
--the EmployeeInfo table.

select right(emplname,4) from employeeinfo1


--Trim
select trim('a' from empfname) from employeeinfo1

select trim('a' from empfname) from employeeinfo1


--. Remove a only from the left (leading) side:

select trim(LEADING 'a' from empfname) from employeeinfo1

select trim(TRAILING 'a' from empfname) from employeeinfo1


select trim('a ' from empfname) from employeeinfo1

--5)Write a query to fetch only the place name(string before brackets) from 
--the Address column of EmployeeInfo table.

select * from employeeinfo1

select position('(' in address) from employeeinfo1

select substring(address, 2, 4) from employeeinfo1

select substring(address, 1, position('(' in address)-1) from employeeinfo1

--6)Write a query to create a new table which consists of data and structure copied 
--from the other table.

create table emp_x as (select empfname, emplname from employeeinfo1)

select * from emp_x

--7)Write a query to find all the employees whose salary is between 50000 to 100000.

select * from employeeposition
where salary between 50000 and 100000

select empid from employeeposition
where salary between 50000 and 100000


select * from employeeinfo1
where empid in (
				select empid from employeeposition
				where salary between 50000 and 100000
				)
				
				
-- join
select employeeinfo1.empid,employeeinfo1.empfname,employeeinfo1.emplname, employeeposition.empid,employeeposition.salary
from employeeinfo1
join employeeposition on employeeinfo1.empid = employeeposition.empid
where employeeposition.salary between 50000 and 100000



--11)Write a query find number of employees whose DOB is 
--between 02/05/1970 to 10/12/1994 
--and are grouped according to gender

select gender,count(dob) from employeeinfo1
where dob between '02/05/1970' and '10/12/1994'
group by gender


select *, extract(day from dob) as day,extract(month from dob) as month, extract(year from dob) as year
from employeeinfo1

---Q16. Write a query to fetch all employees who also hold the managerial position.
select employeeinfo1.*, employeeposition.*
from employeeinfo1
join employeeposition on employeeinfo1.empid = employeeposition.empid
where employeeposition.empposition = 'Manager'

--17)Write a query to fetch the department-wise count of employees 
--sortedby department’s count in ascending order.





