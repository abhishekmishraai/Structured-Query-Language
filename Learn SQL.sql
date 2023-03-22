select version();

select 5*3;

select 5+3;



-- 1. Creating a new table with there columns
create table movie(movie_id int, movie_name varchar(40), Movie_genere varchar(40), imdb_rating real);

select * from movie;


 
-- 2. Delete the teble
drop table movie;

select * from movie;



-- 3. Creating a new table and insert data into it
create table movie(
    movie_id int, movie_name varchar(40), Movie_genere varchar(40), imdb_rating real);


insert into movie(
    movie_id, movie_name, Movie_genere,imdb_rating)
    values(100, 'Ram milai jodi ek andha ek kodhi', 'comidy', 3.5),
    (101,'raja ram', 'drama', 4.9),
    (102, 'rama rama', 'drama', 4.3);

select * from movie



-- 4. Updating recods in the existing table
update movie
  set Movie_genere = 'drama, crime'
  where movie_id = 101;

select * from movie where movie_id = 101;




-- 5. Delete recprd from a table
delete from movie
  where movie_id=100;

select * from movie;




-- 6. Learn where clause
select * from movie
  where imdb_rating > 4.5;

select * from movie
  where imdb_rating < 4.5;




-- 7. Using between clouse
select * from movie
  where imdb_rating between 4.0 and 5.9;




-- 8. Using in operetor
select * from movie
  where imdb_rating in (4.3,4.2)




-- 9. Creating a data table

drop table employees

create table employees
(Emp_id int not null primary key,
  Emp_name varchar(40),
  Email_address varchar(40),
  Gender varchar(40),
  Department varchar(40),
  Address varchar(40),
  Salary real);

COPY employees FROM 'C:\Users\WIN 7\Desktop\abc.csv' with CSV HEADER;

select * from employees




-- 10 Check Unique values in the dataset
select distinct Address from employees;




-- 11. Check for null values
    select * from employees
    where Email_address is null;




-- 12. Apply orderby clouse
  -- Asssending
    select * from employees order by salary;

  -- Decending
    select * from employees order by salary desc;




-- 13. rename column name
    alter table employees
    rename column address to Country;

    select * from employees



-- 14. using and or operetor
  -- And operetor
    select * from  employees
      where 
        country = 'China' and salary >12000;

    
  -- Or operetor
    select * from  employees
      where 
        country = 'China' or  department = 'Marketing';  




-- 15. using Lmit clause
    select * from employees order by salary desc limit 5;  




-- 15. using offset clause
    select * from employees order by salary desc limit 5 offset 3; 




-- 16. using fetch clause
    select * from employees order by salary desc fetch first 3 rows only; 
    
    select * from employees order by salary desc offset 3 fetch first 3 rows only;




-- 17. Using like operator

    select * from employees
      where emp_name like 'A%';

    select * from employees
      where emp_name like 'A%y';

    select * from employees
      where emp_name like 'A%l%y';

    select * from employees
      where emp_name like '%le%';

    select * from employees
      where emp_name like '_a%';

      
    select * from employees
      where emp_name like '__r%';




-- 18. using mathmatical function
  -- sum
    select sum(salary) as total_salary from employees;

  -- Avrage
    select avg(salary) as total_salary from employees;

  -- Max
    select max(salary) as max_salary from employees;

  -- min
    select min(salary) as min_salary from employees;

  -- distinct
    select distinct department as total_department from employees;
  

  -- count 
    select count(distinct department) as total_department from employees;




-- 19. using update camand for filling the null values
  select * from employees
    where department is null;

    
  update employees
   set department = 'Training'
     where department is null;

  select * from employees
    where department is null;




-- 20. Using groupby function
    select country, avg(salary) as avrage_salary from employees
      group by country
        order by avrage_salary desc;
    


    select gender, max(salary) as amaxmim_salary from employees
      group by gender;


      
    select country, count(emp_id) as amaxmim_salary from employees
      group by country;




-- 21. using having clause
    select country, avg(salary) as avrage_salary from employees
      group by country
        having avg(salary)>13000



    select country, count(emp_id) as avrage_salary from employees
      group by country
        having count(emp_id)<20
          order by avrage_salary desc;   




-- 22. Using case(If-Else) statment  
    select department, country, salary,
      case 
        when salary > 13000 and salary < 15000
          then 'high salary'
        when salary < 13000 and salary > 0
          then 'low salary'
        end as salary_range
      from employees 
      order by salary desc;




-- 23. Using sub qurry in a qurray
    select department, country, salary from employees
      where salary >(select avg(salary) from employees);


        

--24. SQL Function
    select abs(-100)


    select greatest(12,13,19,14,15,11,18)


    select least (12,13,19,14,15,11,18)   


    select mod(54,10)


    select power (2,3)


    select sqrt(100)


    select sin(90)


    select floor(6.47);




-- 24using string function
    select char_length('india is my country')


    select concat('my name is abhishek mishra ', 'i am ', 'a data scientest ')



    select left('my name is abhishek mishra', 5)



    select right('my name is abhishek mishra', 12)


    select repeat('india ',5)


    select reverse('my name is abhishek mishra')


-- 25 Create user define function--
    create or replace function
    count_emails()
    returns integer as $total_emails$
    declare
      total_emails integer;

    begin
      select count(email_address) into total_emails from employees;
      return total_emails;
    end;
    $total_emails$ language plpgsql;

select count_emails();



    
