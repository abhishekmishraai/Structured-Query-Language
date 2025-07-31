--Window Function

--Find maximum salary from each department.
select * from employeeinfo1
select * from employeeposition 

select employeeposition.salary
,employeeinfo1.department,
row_number() over(partition by employeeinfo1.department order by employeeposition.salary desc) as row_number
from employeeinfo1
join employeeposition on employeeposition.empid = employeeinfo1.empid



select * from (select employeeposition.salary
,employeeinfo1.department,
row_number() over(partition by employeeinfo1.department order by employeeposition.salary desc) as row_number
from employeeinfo1
join employeeposition on employeeposition.empid = employeeinfo1.empid)
where row_number = 2

--RANK function
select * from staff
select * from staff_salary

select staff.staff_type,staff_salary.salary,
row_number() over(partition by staff.staff_type order by staff_salary.salary desc) as row_number,
rank() over(partition by staff.staff_type order by staff_salary.salary desc) as rank,
DENSE_RANK() over(partition by staff.staff_type order by staff_salary.salary desc) as DENSE_RANK
from staff
join staff_salary on staff_salary.staff_id = staff.staff_id


--view

create view demo as (
select staff.staff_type,staff_salary.salary,
row_number() over(partition by staff.staff_type order by staff_salary.salary desc) as row_number,
rank() over(partition by staff.staff_type order by staff_salary.salary desc) as rank,
DENSE_RANK() over(partition by staff.staff_type order by staff_salary.salary desc) as DENSE_RANK
from staff
join staff_salary on staff_salary.staff_id = staff.staff_id
)

select * from demo








