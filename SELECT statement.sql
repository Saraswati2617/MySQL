select * 
from employee_demographics;

select *
from employee_demographics;

select *
from parks_and_recreation.employee_demographics;

#selecting particular columns
select first_name 
from employee_demographics;

select  first_name,age
from employee_demographics;

#PEMDAS
select first_name,
last_name,
age,
(age+10)+10
from employee_demographics;

#DISTINCT keyword
select distinct gender
from employee_demographics;

#more than one distinct values are taken as group and found distinct
select distinct first_name,gender
from employee_demographics;
 
