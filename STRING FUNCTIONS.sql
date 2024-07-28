#string functions

#1.LENGTH
select length('saraswati');

select first_name,length(first_name) as name_length
from employee_demographics
order by 2;

#2.upper and lower
select 
upper(first_name) as firstname,
lower(last_name) as lastname
from employee_demographics;

#trim---left trim and right trim
select trim('        hello        ') as fulltrim,
rtrim('        hello        ') as righttrim,
ltrim('        hello        ') as lefttrim;

#left() how many characters from left from given string
select first_name,left(first_name,4)
from employee_demographics;

#right
select first_name,right(first_name,4)
from employee_demographics;

#substring
select first_name,
substring(first_name,3,2)
from employee_demographics;

select birth_date,
substring(birth_date,6,2) as birthmonth
from employee_demographics;

#replace --- case sensitive
select first_name,replace(first_name,'A','z')
from employee_demographics;

#locate ---not case sensitive
select locate('x',"alexander");

select first_name,
locate("An",first_name)
from employee_demographics;

#concatenate
select first_name,last_name,
concat(first_name,' ',last_name)as full_name
from employee_demographics;