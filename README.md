# Data-Science-Salary-Analysis


## Introduction:
Data Science is one of the top growing professions, it is an interdisciplinary field that uses statistics, scientific computing, algorithms, IT, thus it offers a wide range of job positions ranging from Data Engineer to Research Analyst etc.
![](https://github.com/Mayreeobi/2023-Data-Science-Salary-Analysis/blob/main/datascience.jpg)


## Problem Statement:
To fully understand why most professionals are transitioning to data science jobs, an in-depth qualitative analysis is required focusing on the salary distribution based on experience and employment types, remote ratio preferences and trends in entry-level hiring can provide cognitive reasons for the shift, as well as inform intending professionals on the paths to take.
### Key Questions
-	What is the average salary?
-	What is the average salary in different levels of  experience and employment types?
-	What is the distribution of remote ratio?
-	What is the top 10 paid data science job designation?
-	Compare the salaries of professionals across the world?
-	What year has the highest influx of entry level professionals?
-	Does the size of the company impact the salaries?

## Skills Demonstrated:
1. SQL
2. Microsoft PowerBI for visualization


## Data Sourcing:
The dataset was sourced from kaggle.com https://www.kaggle.com/datasets/arnabchaki/data-science-salaries-2023. 


## Data Transformation:
The dataset underwent meticulous data transformation using SQL. This involved cleaning, correcting data types, and ensuring consistency in categorical variables such as experience level, employment type, and remote work ratio. These transformations laid the foundation for accurate analysis and visualization of data science salaries.

The dataset contains 11 columns and 3755 rows. The followings were carried out:
1. Renamed the dataset;
2. Checked for duplicates, missing values and blank cells;
3. Data types corrected;
4. Made the data consistency by replacing followings:
      -	Experience level 
             EN: Entry level
             MI : Mid/Intermediate level
             SE: Senior Level
             EX : Executive

      -	Employment types
             FT: Full Time
             PT: Part Time
             CL: Contract
             FL: Freelance

      - Remote ratio
             0: On-site (Working from the office)
             50: Hybrid(Working from both office and home at times)
             100: Fully Remote(Working from Home)
        
* SQL Queries [Here](https://github.com/Mayreeobi/2023-Data-Science-Salary-Analysis/blob/main/dsqueries.sql)


## Analysis and Visuzlization:
Through interactive dashboards created using Microsoft PowerBI, the project offers comprehensive insights into data science salary trends. Key findings include the average salary landscape, demand for executive and full-time professionals, distribution of remote work preferences, top-paid job titles, geographical salary variations, trends in entry-level hiring, and the impact of company size on salaries.
Dashboard snippet [Here](https://github.com/Mayreeobi/2023-Data-Science-Salary-Analysis/blob/main/datascience.pdf)

* Interactive dashboard [Here](https://app.powerbi.com/view?r=eyJrIjoiZGNlYzJkNzktNTM3MS00NWM1LWEwNzgtM2E5MDNhNjdlYzY2IiwidCI6ImExZGNjNGZiLTRlYzAtNGI1Ni04NDg1LTRmOTgzYzMyODY0MiJ9)



## Insights:
- The Average Salary Landscape: The average salary stands at $137,570, providing a benchmark for understanding the overall compensation within the data science domain.
- Demand for Executive and Full-Time Professionals: Executive and full-time professionals are highly sought after in the data science job market, indicating a premium placed on leadership roles and dedicated, full-time commitments.
- Work Arrangement Distribution: Among the reported work arrangements, On-site leads with the highest count at 1,923, followed by Fully Remote at 1,643, and Hybrid at 189, indicating diverse work preferences within the data science sector.
- Salary Range and Top-Paid Job Titles: The average salary exhibits a range from $190,264 to $375,000. The top three highest-paid job titles are Data Science Tech Lead, Cloud Data Architect, and Data Analytics Lead.
- Geographical Impact on Salaries: Location significantly influences salary distribution. Across 35 company locations, professionals in the United States earn the highest salaries compared to other countries, highlighting regional salary variations.
- Trends in Entry-Level Hiring: The data reveals a notable surge in entry-level data science professionals in 2022, followed by a slight decrease in 2023. This trend suggests a dynamic hiring landscape within the field.
- Employee Residence Insights: The highest count of employee residences is recorded in the USA at 3,004, indicating a significant concentration of data science professionals. The United Kingdom and Canada follow closely in employee residence count, while Macedonia Republic represents the lowest contribution.
- Top-Ranked Data Science Job Title: The top three job titles by count are Data Engineer: 1,040 (1st rank) followed by Data Scientist: (2nd rank) and Data Analyst: (3rd rank). 
- Company Size and Salary Dynamics: While the company size is a factor influencing salaries, it is essential to consider various other factors that contribute to the compensation structure.

## Conclusion:
The project concludes that data science is a high-paying and in-demand field with salary variations influenced by factors such as skills, experience, job profile, location, and company size. To succeed in the data science domain, aspiring professionals are encouraged to develop essential skills, join data communities, work on projects, and engage in continuous learning and practice.

By providing valuable insights into data science salaries, this project serves as a guide for professionals navigating the dynamic landscape of the data science industry.


