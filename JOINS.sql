#JOINS deals with combinig of columns from tables
#by default join is inner join
select *
from employee_demographics
join employee_salary
on employee_demographics.employee_id = employee_salary.employee_id;

select dem.employee_id,age,occupation
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id = sal.employee_id;

#outer join are of two types right outer and left outer

select *
from employee_demographics as dem
left join employee_salary as sal
on dem.employee_id=sal.employee_id;

select *
from employee_demographics as dem
right join employee_salary as sal
on dem.employee_id=sal.employee_id;

select dem.first_name,occupation,salary
from employee_demographics as dem
left join employee_salary as sal
on dem.employee_id=sal.employee_id;

#self join
select *
from employee_demographics as emp1
join employee_salary as emp2
on emp1.employee_id=emp2.employee_id;

select emp1.first_name as santa,
emp2.first_name as employee
from employee_demographics as emp1
join employee_salary as emp2
on emp1.employee_id +1=emp2.employee_id; #+1

#multiple table joining
select*
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id
join parks_departments as park
on sal.dept_id=park.department_id;