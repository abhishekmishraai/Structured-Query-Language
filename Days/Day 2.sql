select * from address

select * from classes

select * from movies

select * from parents

select * from school

select * from staff

select * from staff_salary

select * from student_classes

select * from student_parent

select * from students

select * from subjects

-- 10 Check Unique values in the dataset
select * from students

select distinct(gender) from students

select * from address

select distinct(country) from address

select distinct(state) from address

-- 11. Check for null values
select * from address
where street is null


select * from address
where country is null

---- 12. Apply orderby clouse
select * from students
order by first_name asc

select * from students
order by first_name desc

select * from students
order by age desc

select * from students
order by age

--13. rename column name
select * from movies

alter table movies
rename column genere to movie_genere

select * from movies

-- 14. using and or operetor
select * from staff_salary

select * from staff_salary
where salary > 10000 and currency = 'USD'
order by salary

select * from staff_salary
where salary > 10000 and currency = 'USD'
order by salary desc

---- 15. using Lmit clause
select * from staff_salary
order by salary desc
limit 2

-- 15. using offset clause
select * from staff_salary
order by salary desc
offset 2

select * from staff_salary
order by salary desc
offset 2
limit 2


select * from staff_salary
order by salary
offset 1
limit 1





