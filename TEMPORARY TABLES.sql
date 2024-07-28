#TEMPORARY TABLE

CREATE temporary table tempo_table
(first_name varchar(50),
last_name varchar(50),
fav_movie varchar(50));
#select*
#from temp_table;
insert into tempo_table
values('saras',"yadav","heeramandi");
select *
from tempo_table;


create temporary table salary_above_50k
select*
from employee_salary
where salary>50000;
select*
from salary_above_50k;