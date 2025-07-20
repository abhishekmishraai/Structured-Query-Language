select * from employeeposition

select * from employeeinfo1

----Q18. Write a query to find the even and odd records from a table.
--even

select empid from employeeinfo1
where empid%2 = 0

select * from employeeinfo1
where empid in (select empid from employeeinfo1
				where empid%2 = 0)



select * from employeeinfo1
where empid%2 = 0


--odd
select * from employeeinfo1
where empid in (select empid from employeeinfo1
				where empid%2 != 0)
				
				

select * from employeeinfo1
where empid%2 != 0


---Q19. Write a SQL query to retrieve employee details from EmployeeInfo table 
--who have a date of joining in the EmployeePosition table.

select employeeinfo1.*, employeeposition.*
from employeeinfo1
join employeeposition on employeeposition.empid = employeeinfo1.empid

--22)Write a query to retrieve Departments who have less than 2 employees working in it.

select * from employeeinfo1

select department,count(department) as count_emp from employeeinfo1
group by department
having count(department) < 2

--23)Write a query to display the first and the last record from the EmployeeInfo table.
select * from employeeinfo1

select min(empid) from employeeinfo1
select max(empid) from employeeinfo1


select * from employeeinfo1
where empid in ((select min(empid) from employeeinfo1),
				(select max(empid) from employeeinfo1))
				
				
---Write a query to find the third-highest salary from the EmpPosition table.
-- using view

select * from employeeposition
order by salary desc

select * from employeeposition
order by salary desc
offset 2
limit 1


create view third_higest_salary as (
									select * from employeeposition
									order by salary desc
									offset 2
									limit 1
									)
									

select * from third_higest_salary

--creating new table using the existing table

create table xyz as (
					select * from employeeposition
					order by salary desc
					offset 2
					limit 1
)

select * from xyz


--1. find duplicate records in a table
select empid,count(empid) from employeeinfo1
group by empid
having count(empid) > 1




