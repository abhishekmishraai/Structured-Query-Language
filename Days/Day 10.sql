select * from address

select * from classes

select * from parents

select * from school

select * from staff

select * from staff_salary

select * from student_classes

select * from student_parent

select * from students

select * from subjects

-- 1.Fetch the full name of all staff who teach Mathematics.

select staff.first_name||' '||staff.last_name as full_name,classes.subject_id,subjects.subject_name
from staff
join classes on staff.staff_id = classes.teacher_id
join subjects on classes.subject_id = subjects.subject_id
where subjects.subject_name = 'Mathematics'


-- 2. Count no of students in each class

select class_id, count(class_id) from student_classes
group by class_id
order by count(class_id) desc


----3. Return only the records where there are more than 100 students in each class

select class_id, count(class_id) from student_classes
group by class_id
having count(class_id) > 100
order by count(class_id) desc


--4. Parents with more than 1 kid in school.
select parent_id, count(parent_id) from student_parent
group by parent_id
having count(parent_id) > 1


--5. SUBQUERY: Query written inside a query is called subquery.
-- Fetch the details of parents having more than 1 kids going to this school. Also display student details.

select parent_id from student_parent
group by parent_id
having count(parent_id) > 1

select students.first_name||' '||students.last_name as student_name,
parents.first_name||' '||parents.last_name as parent_name,
address.street||' '||address.city||' '||address.state||' '||address.country as address
from students
join student_parent on student_parent.student_id = students.id
join parents on parents.id = student_parent.parent_id
join address on parents.address_id = address.address_id
where student_parent.parent_id in (
									select parent_id from student_parent
									group by parent_id
									having count(parent_id) > 1
									)

-- 6. Staff details who’s salary is less than 5000

select staff.*,staff_salary.*
from staff
join staff_salary on staff.staff_id = staff_salary.staff_id
where staff_salary.salary < 5000





