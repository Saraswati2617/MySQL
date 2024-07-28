#LIMIT and ALIASING

#limit means the number of rows you want to print
#limit 2,1 means begin from row 2 and result 1 row after it

select*
from employee_demographics
order by age desc
limit 2,3; #three rows after 2nd row


#ALIASING is way to rename the column .
#AS acn or cannot be used

SELECT gender,avg(age) as avg_age
from employee_demographics
group by gender
having avg(age)>40;

SELECT gender,avg(age) avg_age
from employee_demographics
group by gender
having avg(age)>40;