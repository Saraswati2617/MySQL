#GROUP BY 
#specially to perform aggregate functions like avg,min,max,count

Select gender
from employee_demographics
group by gender;

select gender,max(age),min(age),avg(age),count(age)
from employee_demographics
group by gender;

select occupation,salary
from employee_salary
group by occupation,salary;

select occupation
from employee_salary
group by occupation;

#ORDER BY
select *
from employee_demographics
order by gender;

select *
from employee_demographics
order by gender,age desc;

select*
from employee_demographics
order by first_name desc,age asc;



