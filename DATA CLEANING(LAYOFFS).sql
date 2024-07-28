#***********Data cleaning**********

select * 
from world_layoffs.layoffs;
#set as default schema

#==============CHECKING DUPLICATES==============
#creating table--- a copy of actual data=layoffs
create table layoffs_staging like layoffs;

select * from layoffs_staging;

#--inserting into layoffs_staging
insert  layoffs_staging
select * from layoffs;

select * from layoffs_staging;

insert layoffs_staging
select * from layoffs;

create table my_experiment like layoffs;
select * from my_experiment;

insert into my_experiment
select* from layoffs;
select*from my_experiment;

#---getting row number to check on duplicates----if >1 they are duplicates
select *,
row_number()
over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)
as row_num
from layoffs_staging;

#----creating CTE to work upon row_num column
with duplicates_cte as 
(select *,
row_number()
over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)
as row_num
from layoffs_staging)
select *
from duplicates_cte 
where row_num>1;

select *
from layoffs_staging
where company = 'casper';

#---cannot delete using cte because cte does not update the actual table------
with duplicates_cte as 
(select *,
row_number()
over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)
as row_num
from layoffs_staging)
delete
from duplicates_cte 
where row_num>1;

#---creating  and inserting data to new copy "layoffs_staging2" to delete duplicates----
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * 
from layoffs_staging2 ;

insert into layoffs_staging2
(select *,
row_number()
over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)
as row_num
from layoffs_staging);

select *
from layoffs_staging2
where row_num>1;

#--deleting the duplicates---
delete
from layoffs_staging2
where row_num>1;

select *
from layoffs_staging2
where row_num>1;


#=======================STANDARDIZING DATA=========================
select company , trim(company)
from layoffs_staging2;

update layoffs_staging2
set company=trim(company);

select company from layoffs_staging2;
select *from layoffs_staging2;

#---check industry---
select distinct industry
from layoffs_staging2
order by 1;

select distinct industry
from layoffs_staging2
order by industry asc;

update layoffs_staging2
set industry="Crypto"
where industry like 'Crypto%';

select distinct industry
from layoffs_staging2;

#----check location---
select distinct location
from layoffs_staging2
order by 1;

#-----check country----
select distinct country
from layoffs_staging2
order by 1;

select* 
from layoffs_staging2
order by country;


update layoffs_staging2
set country="United states"
where country like "United States.";

#-----check date------
select `date` from layoffs_staging2;

update layoffs_staging2
set `date`= str_to_date(`date`,'%m/%d/%Y');

select *
from layoffs_staging2;

alter table layoffs_staging2
modify column `date` date;


#=============NULL AND BLANK VALUES=======

#----industry----
select *
from layoffs_staging2
where industry is null or industry='';

select *
from layoffs_staging2
where industry is null or industry='';

select *
from layoffs_staging2
where company='airbnb';

#----update blank to null then work further---
update layoffs_staging2
set industry = null
where industry ='';

select*
from layoffs_staging2
where industry is null;

#--self join---
select t1.industry,t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company=t2.company
where t1.industry is null
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company=t2.company
set t1.industry=t2.industry
where t1.industry is null
and t2.industry is not null;

select *
from layoffs_staging2
where company like 'Bally%';

#-----if total laid off and percentage layoff is null it is useless

select*
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2;

#----row_num column is useless
alter table layoffs_staging2
drop column row_num;

select*from layoffs_staging2;

#========GOT THE FINAL TABLE========
