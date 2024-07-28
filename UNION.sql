#UNION used to give out combination of all rows from tables
Select first_name,last_name
from employee_demographics
union 
select first_name,last_name 
from employee_salary;

#union is by default distinct .... union all also results duplicates

Select first_name,last_name
from employee_demographics
union all
select first_name,last_name 
from employee_salary;

Select first_name,last_name
from employee_demographics
where age>50
union 
select first_name,last_name 
from employee_salary
where salary>70000;

Select first_name,last_name,'old man' as label
from employee_demographics
where age>50
union 
Select first_name,last_name,'old lady' as label
from employee_demographics
where age>40
union
select first_name,last_name,'high salary'as label
from employee_salary
where salary>70000
order by first_name,last_name;


select first_name,last_name 
from employee_demographics;

select first_name,last_name
from employee_salary;