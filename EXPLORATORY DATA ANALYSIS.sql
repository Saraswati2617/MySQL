#====EXPLORATORY DATA ANALYSIS======

#---Analysing the number of people laid off in various respectives:date,stages,companies etc.
select*
from  layoffs_staging2;

#--maximum people laid off overall
select max(total_laid_off) ,max(percentage_laid_off)
from layoffs_staging2;

#--companies that laid off 100%
select *
from layoffs_staging2
where percentage_laid_off=1;

#if the company laid off 100%,how many toatl people were there?-total_laid_off
select *
from layoffs_staging2
where percentage_laid_off=1
order by total_laid_off desc;

#total funding done and then % laid off
select *
from layoffs_staging2
where percentage_laid_off=1
order by total_laid_off desc,funds_raised_millions desc;

#start date and end date in data of people being laid off
select min(`date`),max(`date`)
from layoffs_staging2;           #2020-03-11	2023-03-06

#Company wise total laid off(sum of people laid off in all the years)
select company,sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

#industry wise total laid off
select industry,sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

#country wise total laid off in 3 years
select country,sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

#year wise laid off
select year(`date`),sum(total_laid_off)
from layoffs_staging2
where year(`date`) is not null
group by year(`date`)
order by 1;

#stage wise laid off
select stage,sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

#date wise laid off
select substring(`date`,1,7),sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by substring(`date`,1,7)
order by 1;

#rolling sum of laid off date wise
with rolling_total as 
(
select substring(`date`,1,7) as timeline,sum(total_laid_off) as total_sum
from layoffs_staging2
where substring(`date`,1,7) is not null
group by substring(`date`,1,7)
order by 1)
select timeline,total_sum,sum(total_sum) over(order by( timeline)) as rolling_sum
from rolling_total;

#how many people laid off by each company in each year
select company,year(`date`),sum(total_laid_off)
from layoffs_staging2
group by company,year(`date`)
order by 1 asc;

select company,year(`date`),sum(total_laid_off)
from layoffs_staging2
group by company,year(`date`)
order by 3 desc;

#ranking which company laid most people off in each year
select company,year(`date`),sum(total_laid_off),
dense_rank()over(partition by year(`date`) order by sum(total_laid_off) desc) ranking
from layoffs_staging2
where year(`date`) is not null
group by company,year(`date`);

#or by using cte

with ranking_cte as(
select company,year(`date`) as years,sum(total_laid_off) as sum
from layoffs_staging2
group by company,year(`date`)
)
select *,
dense_rank()over(partition by years order by sum desc) ranking
from ranking_cte
where years is not null
order by ranking;

#top 5 companies who laid off per year
with ranking_cte as(
select company,year(`date`) as years,sum(total_laid_off) as sum
from layoffs_staging2
group by company,year(`date`)
),
company_ranking as(
select *,
dense_rank()over(partition by years order by sum desc) ranking
from ranking_cte
where years is not null)
select *
from company_ranking 
where ranking <=5;
