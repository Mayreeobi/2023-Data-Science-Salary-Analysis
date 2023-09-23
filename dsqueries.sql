CREATE DATABASE IF NOT EXISTS datascience;
USE datascience;

SELECT * FROM ds;
DESCRIBE ds;

### DATA CLEANING  
## drop irrelevant column
ALTER TABLE ds
DROP COLUMN salary;

-- Replace experience level with the appropriate terms --
UPDATE ds 
SET 
    experience_level = REPLACE(REPLACE(REPLACE(REPLACE( experience_level,
            'SE', 'Senior'),
            'MI', 'Mid/Intermidate'),
             'EN', 'Entry Level'),
			'EX', 'Executive');
        
-- Replace employment type --
UPDATE ds
SET employment_type = REPLACE(REPLACE(REPLACE(REPLACE(employment_type, 
     'FT', 'Full Time'),
     'PT', 'Part Time'),
     'CT', 'Contract'),
     'FL', 'Freelance');

-- Replace company size with the ffg
UPDATE ds
SET company_size = REPLACE(REPLACE(REPLACE(company_size,
     'L', 'Large'),
     'M', 'Medium'),
     'S', 'Small');
     
-- Replace remote ratio with Hybrid, Remote and On-site
ALTER TABLE ds
MODIFY remote_ratio varchar(20);

UPDATE ds
SET remote_ratio = REPLACE(remote_ratio,
    '0', 'On-site');
    # '50', 'Hybrid');
    # '100', 'Fully Remote');
     
Rollback;

Select remote_ratio, COUNT(*)
FROM ds WHERE remote_ratio = 'on-site';

-- 1. Average salary in 2023
SELECT (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS average_salary FROM ds WHERE work_year ='2023';

-- 2. 2023 Average salary by level of experience
SELECT experience_level,
       (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS avg_salary 
FROM ds 
WHERE work_year ='2023'
GROUP BY experience_level 
ORDER BY avg_salary DESC;


SELECT experience_level,
     #employment_type, 
    # company_size,
     (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS avg_salary 
FROM ds 
GROUP BY experience_level, employment_type, company_size 
ORDER BY avg_salary DESC;

-- 3. 2023 Average salary by employment types
SELECT employment_type,
     (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS avg_salary 
FROM ds
WHERE work_year ='2023'
GROUP BY employment_type
ORDER BY avg_salary DESC;

-- 4. Compare the salaries of professionals across the world in 2023
SELECT company_location, 
       (CONCAT('$',SUM(salary_in_usd))) AS total_salary
FROM ds
WHERE work_year ='2023'
GROUP BY company_location
ORDER BY total_salary DESC;

-- 5. What's the remote ratio distribution in 2023?
SELECT 
    remote_ratio,
    COUNT(*) AS count
FROM
    ds
    WHERE work_year ='2023'
GROUP BY  remote_ratio
ORDER BY count DESC;

-- 6. What's the top 10 data science job in 2023
SELECT job_title, 
     COUNT(*) AS count
FROM ds
WHERE work_year ='2023'
GROUP BY job_title
ORDER BY count DESC
LIMIT 10;

-- 6a. What's the data science job distribution in 2023
SELECT job_title, 
     COUNT(*) AS count
FROM ds
WHERE work_year ='2023'
GROUP BY job_title
ORDER BY count DESC;

-- 7. What's the top 10 paid data science job in 2023
SELECT job_title, 
     (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS avg_salary 
FROM ds
WHERE work_year ='2023'
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 10;

-- 8. What year has the highest influx of entry level professionals
SELECT 
    work_year,
    COUNT(*) AS count
FROM ds
WHERE experience_level = 'Entry level'
GROUP BY experience_level, work_year
ORDER BY count DESC;

-- 9. Does the size of the company impact the salaries in 2023
SELECT  company_size,
     (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS avg_salary 
FROM ds
WHERE work_year ='2023' 
GROUP BY company_size 
ORDER BY avg_salary DESC;

-- 10. What's the breakdown of employees residence in 2023?
SELECT employee_residence, COUNT(*) AS count
FROM ds
WHERE work_year ='2023'
GROUP BY employee_residence
ORDER BY count DESC;

-- 11. What's ranking of data science job title distribution in 2023 --
With ds as (
SELECT job_title,
    COUNT(*) AS job_count from ds
    WHERE work_year ='2023'
    GROUP BY  job_title)
select job_title, job_count,
    dense_rank() over( order by job_count desc) AS job_count_ranking
FROM
    ds
ORDER BY job_count DESC;

SELECT (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS average_salary FROM ds WHERE work_year ='2023';
