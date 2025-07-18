--------joint
select * from staff

select * from staff_salary

--inner join
select staff.first_name, staff.last_name, staff_salary.salary
from staff
inner join staff_salary on staff.staff_id = staff_salary.staff_id

select staff.staff_id as left_table_pk,staff.first_name, staff.last_name, staff_salary.staff_id as right_lable_pk,staff_salary.salary
from staff
join staff_salary on staff.staff_id = staff_salary.staff_id

--Right join
select staff.staff_id as left_table_pk,staff.first_name, staff.last_name, staff_salary.staff_id as right_lable_pk,staff_salary.salary
from staff
Right join staff_salary on staff.staff_id = staff_salary.staff_id


--left join
select staff.staff_id as left_table_pk,staff.first_name, staff.last_name, staff_salary.staff_id as right_lable_pk,staff_salary.salary
from staff
left join staff_salary on staff.staff_id = staff_salary.staff_id

--full outer join
select staff.staff_id as left_table_pk,staff.first_name, staff.last_name, staff_salary.staff_id as right_lable_pk,staff_salary.salary
from staff
full outer join staff_salary on staff.staff_id = staff_salary.staff_id

---
select staff.first_name, staff.last_name, staff_salary.salary
from staff
inner join staff_salary on staff.staff_id = staff_salary.staff_id
where staff_salary.salary > 13000


select staff_id from staff_salary
where salary > 13000


select * from staff
where staff_id in (select staff_id from staff_salary
					where salary > 13000)
					
					
----Using case(If) statment
select *,
	case when salary > 13000 then 'High_Salary'
		 when salary < 10000 then 'Low_Salary'
		 else 'M_Salary' 
		 end as salary_range
from staff_salary



--24. SQL Function
select abs(-8)
select abs(8)

select greatest(10,11,23,1,2,3)

select least(10,11,23,1,2,3)

select mod(3,2)
select mod(4,2)

select power(4,2)
select power(3,3)

select sqrt(100)
select sqrt(10)
select sqrt(4)





