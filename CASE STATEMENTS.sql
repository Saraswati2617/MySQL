#case statements

select first_name,last_name,age,
case
    when age<=30 then "young"
    when age between 31 and 50 then "old"
    when age>=50 then "on death's door"
end as age_look
from employee_demographics;

select 
concat(first_name,' ',last_name) as full_name,
salary,
case
    when salary<5000 then salary*1.05
    when salary>5000 then salary*1.07
end as new_salary,

case
    when dept_id=6 then salary*.10
end as bonus
from employee_salary;