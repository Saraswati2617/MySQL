#HAVING VS WHERE

#HAVING is used to filter the aggregated functions and is written under group by

SELECT gender ,avg(age)
from employee_demographics
group by gender
having avg(age)>40;

#using both in one
Select occupation,salary,avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation,salary
having avg(salary)>75000;