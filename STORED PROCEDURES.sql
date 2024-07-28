#STORED PROCEDURES--way to store sql codes to reuse them
create procedure large_salaries()
select*
from employee_salary
where salary>=50000;
call large_salaries();


#DELIMITER ---to run more than one set of statements
DELIMITER $$
create procedure large_salaries2()
begin
     select*
     from employee_salary
     where salary>=50000;
     select*
     from employee_salary
     where salary>=10000;
end $$
delimiter ;
call large_salaries2();

#PARAMETER PASSING 
DELIMITER $$
create procedure large_salaries3(parameter int)
begin
     select*
     from employee_salary
     where employee_id=parameter;
end $$
delimiter ;
call large_salaries3(1);