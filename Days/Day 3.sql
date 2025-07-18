----- 17. Using like operator
select * from students

select * from students
where first_name like 'L%'

select * from students
where first_name like '%s'

select * from students
where first_name like 'L%s'

select * from students
where first_name like '_a%'


select * from students
where first_name like '__a%'

select * from students
where first_name like 'La%s'

-- 20. Using groupby function
select * from students

select count(*) from students

select max(age) from students

select min(age) from students

select avg(age) from students


select gender,avg(age) as avg_age from students
group by gender


select gender, count(age) as count_age from students
group by gender

select gender, max(age) as max_age from students
group by gender

select gender, max(age) as max_age from students
group by gender
order by gender

select gender, max(age) as max_age from students
group by gender
order by gender desc

select gender, max(age) as max_age from students
group by gender
order by max_age desc

select gender, max(age) as max_age from students
group by gender
order by max_age desc
limit 1

--having

select gender, max(age) as max_age from students
group by gender
having gender = 'Male'

select gender, max(age) as max_age from students
group by gender
having gender = 'Female'


select gender, max(age) as max_age from students
group by gender
where gender = 'Male'


select gender, max(age) as max_age from students
where gender = 'Male'
group by gender

--
select * from staff
where age = 56 and staff_type = 'Teaching'


select * from staff
where age = 56 and staff_type in ('Teaching','Non-Teaching')

select * from staff_salary

select staff_id from staff
where age = 56 and staff_type in ('Teaching','Non-Teaching')


select * from staff_salary
where staff_id in ('STF2004','STF1003')


-- Query inside query
select * from staff_salary
where staff_id in (select staff_id from staff
				   where age = 56 and staff_type in ('Teaching','Non-Teaching'))






