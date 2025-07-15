select version()

select 2+5 as column_A

select 2-5 as column_A

select 2*5 as column_A

select 20/5 as column_A

select round(20.12345/5,3) as column_A


-- 1. Creating a new table with there columns

create table movies(Movie_id int, movie_name varchar(20), genere varchar(20), revenue int)

select * from movies


select movie_name, revenue from movies

-- 2. Delete the teble

drop table movies

select * from movies


-- 3. Creating a new table and insert data into it

create table movies(Movie_id int, movie_name varchar(20), genere varchar(20), revenue int)

select * from movies

insert into movies(Movie_id, movie_name, genere, revenue)
		values(100, 'OMG', 'Drama', 123232),
			  (101, 'KGF', 'Action',323453),
			  (102, 'OMG2', 'Comedy',5422211)

select * from movies

select MOvie_name,geNere from Movies

-- 4. Updating recods in the existing table
update movies set genere = 'Drama & Comedy'
where movie_id = 101

select * from movies

-- 5. Delete record from a table

delete from movies
where movie_id = 101

select * from movies

select * from         		



			movies
			
			
--date Time

show timezone
select now()
select timeofday()
select current_time
select current_date

--string
select 'ram'||'singh' as full_name

select 'ram'||' '||'singh' as full_name

select * from movies


select movie_name||' '||genere as name_and_genere from movies

/* 
Comparison Operators:=, <>, != , >, <, >=, <=
Arithmetic Operators: +, -, *, /, %
Logical Operators: AND, OR, NOT, IN, BETWEEN, LIKE etc.
*/
select 5 = 10
select 5 != 10
select 5 > 10
select 5 < 10
select 5 >= 10
select 5 <= 10


