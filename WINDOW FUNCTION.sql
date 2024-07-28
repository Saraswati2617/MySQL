#WINDOW FUNCTIONS--like group by but does noot keep their own unique rows in output


#group by that finds average salary of male and female
select gender,avg(salary) as avg_sal
from employee_demographics  as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id
group by gender;

#----over()
#this gives out overall average including male and female
select gender,avg(salary) over()
from employee_demographics as dem
join employee_salary sal
on dem.employee_id=sal.employee_id;


#---over(partition by)
#this gives female and male salary individually
select gender,avg(salary) over(partition by gender)
from employee_demographics as dem
join employee_salary sal
on dem.employee_id=sal.employee_id;

#understand group by
select dem.first_name,dem.last_name,gender,salary,avg(salary) as avg_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id
group by dem.first_name,dem.last_name,gender,salary;

#understand order(partition by)
select dem.first_name,dem.last_name,gender,salary,avg(salary) over(partition by gender) 
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id;

#understand order(partition by..order by...)
select dem.employee_id,dem.first_name,dem.last_name,gender,salary,avg(salary) over(partition by gender  order by  employee_id) 
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id;

#-----**understand order(partition by) by sum()
select dem.first_name,dem.last_name,gender,salary,sum(salary) over(partition by gender) 
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id;

#------**understand order(partition by..order by...) by sum() ------ROLLING UP VALUES
select dem.employee_id,dem.first_name,dem.last_name,gender,salary,sum(salary) over(partition by gender order by dem.first_name) 
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id;

#ROW_NUMBER()----RANK()----DENSE_RANK()
select dem.employee_id,dem.first_name,dem.last_name,gender,salary,
ROW_NUMBER() over(partition by gender order by salary desc) as row_num,
RANK() over(partition by gender order by salary desc) as rank_num,
DENSE_RANK() over(partition by gender order by salary desc) as dense_rank_num
from  employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id;



