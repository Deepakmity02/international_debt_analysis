create database worldbank;
use worldbank;

#selecting all columns from international_debt
select * from international_debt
limit 10;

#finding number of distinct countries
select count(distinct country_name) as total_distinct_count
from international_debt;

#finding out the distinct debt indicators
select  distinct indicator_code as total_distinct_codes
from international_debt
order by total_distinct_codes;

#totaling the amount of debt owed by countries
select round(sum(debt/1000000),2)
from international_debt;

#country with highest debt
select country_name, sum(debt) as total_debt
from international_debt
group by country_name
order by total_debt desc
limit 2;

#average amount of debt across indicators
select indicator_code as debt_indicator,indicator_name,avg(debt) as average_debt
from international_debt
group by debt_indicator,indicator_name
order by average_debt desc limit 10;

#highest amount of principle repayments
select country_name,indicator_name from international_debt
where debt = (select max(debt) from international_debt where indicator_code = 'DT.AMT.DLXF.CD');

#most common debt indicator
select indicator_code, count(indicator_code) as indicator_count
from international_debt
group by indicator_code
order by indicator_count desc, indicator_code desc
limit 30;

#maximum abount of debt each country has
SELECT country_name, COUNT(DISTINCT indicator_code) AS indicator_count
FROM international_debt
GROUP BY country_name
ORDER BY indicator_count DESC, country_name
LIMIT 30;
select country_name, max(debt) as maximum_debt from international_debt
group by country_name
order by maximum_debt desc
limit 5;




