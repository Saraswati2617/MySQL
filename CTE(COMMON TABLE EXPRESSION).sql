#CTE [COMMON TABLE EXPRESSION]---like subqueries but looks formatted and professional

#using subquery:-
select avg(avg_sal)
from(
select gender,avg(salary)avg_sal,max(salary)max_sal,min(salary)min_sal,count(salary)count_sal
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id
group by gender) as example_subquery;

#using cte
WITH cte_example as(
select gender,avg(salary)avg_sal,max(salary)max_sal,min(salary)min_sal,count(salary)count_sal
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id
group by gender)
select avg(avg_sal)
from cte_example;

#multiple cte
with cte_example as (
select employee_id,gender,birth_date
from employee_demographics
where birth_date>'1985-01-01'),

cte_example2 as (
select employee_id,salary
from employee_salary
where salary>50000)

select *
from cte_example
join cte_example2
on cte_example.employee_id=cte_example2.employee_id;

#some extra knowledge 
WITH cte_example (GENDER,AVG_SAL,MAX_SAL,MIN_SAL,COUNT_SAL)as(
select gender,avg(salary)avg_sal,max(salary)max_sal,min(salary)min_sal,count(salary)count_sal
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id
group by gender)
select avg(avg_sal)
from cte_example;
 