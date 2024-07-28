#SUBQUERIES--query within another query

#give the detail of employees who work in dept_id=1
select *
from employee_demographics
where employee_id in
	(select employee_id from employee_salary
    where dept_id=1);
    
select concat(first_name,' ',last_name) as names
from employee_demographics
where employee_id in
	(select employee_id from employee_salary
    where dept_id=1);
    
#give the average of max age,min age
select avg(`max(age)`) as aveg_max
from
(select gender ,
avg(age),max(age),min(age),count(age)
from employee_demographics
group by gender) as agg_func;

select avg(max_age) as aveg_max
from
(select gender ,
avg(age) as avg_age,max(age) as max_age,min(age) as min_age,count(age) as count_age
from employee_demographics
group by gender) as agg_func;

#get avgerage salary to compare with original salary
select first_name,salary,
(select avg(salary) from employee_salary)
from employee_salary;