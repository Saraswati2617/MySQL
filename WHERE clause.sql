#WHERE CLAUSE
select *
from employee_demographics
where first_name='Jerry';

#two sequences of wher clause statement are % and _
#a%  %a%  %a   a__  __a  _a_
select *
from employee_demographics
where first_name like 'jer%';

select *
from employee_salary
where salary like '2%';

select * 
from employee_demographics
where first_name like 'a__'; 

select *
from employee_demographics
where birth_date like '1985%';