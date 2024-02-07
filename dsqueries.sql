SELECT * FROM datascience.ds;

USE datascience;

CREATE TABLE ds(
      work_year	INT,
      experience_level	VARCHAR(20),
      employment_type	VARCHAR(20),
      job_title	VARCHAR(255),
	  salary DOUBLE,
      salary_currency VARCHAR(10),
      salary_in_usd	DOUBLE,
      employee_residence VARCHAR(50),
	  remote_ratio	VARCHAR(20),
      company_location	VARCHAR(50),
	  company_size VARCHAR(20)
);

DESCRIBE ds;

SELECT * FROM ds;


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
UPDATE ds
SET remote_ratio = REPLACE(remote_ratio,
     '0', 'On-site');
     #'50', 'Hybrid');
    #'100', 'Fully Remote');
     
Rollback;

Select remote_ratio, COUNT(*)
FROM ds WHERE remote_ratio = 'on-site';

-- 1. Average salary
SELECT (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS average_salary FROM ds;

-- 2. Average salary by employment types
SELECT employment_type,
     (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS avg_salary 
FROM ds
GROUP BY employment_type
ORDER BY avg_salary DESC;


-- 3. Average salary by level of experience
SELECT experience_level,
       (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS avg_salary 
FROM ds 
GROUP BY experience_level 
ORDER BY avg_salary DESC;
-- 4. What's the remote ratio distribution?
SELECT 
    remote_ratio,
    COUNT(*) AS count
FROM
    ds
GROUP BY  remote_ratio
ORDER BY count DESC;


-- 5. What's the top 10 highest paid data science job globally
SELECT job_title, 
     (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS avg_salary 
FROM ds
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 10;


-- 6. Calculate the salaries of professionals globally
SELECT company_location, 
       (CONCAT('$',SUM(salary_in_usd))) AS total_salary
FROM ds
GROUP BY company_location
ORDER BY total_salary DESC;


-- 7. What year has the highest influx of entry level professionals
SELECT 
    work_year,
    COUNT(*) AS count
FROM ds
WHERE experience_level = 'Entry level'
GROUP BY experience_level, work_year
ORDER BY count DESC;


-- 8. What's the breakdown of employees residence?
SELECT employee_residence, COUNT(*) AS count
FROM ds
GROUP BY employee_residence
ORDER BY count DESC;


-- 9. What's ranking of data science job title distribution --
SELECT
    job_title,
    COUNT(*) AS job_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS job_count_ranking
FROM
    ds
GROUP BY
    job_title
ORDER BY
    job_count DESC;

-- 10. Does the size of the company impact the salaries
SELECT  company_size,
     (CONCAT('$',(ROUND(AVG(salary_in_usd),0)))) AS avg_salary 
FROM ds 
GROUP BY company_size 
ORDER BY avg_salary DESC;
