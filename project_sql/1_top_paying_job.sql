/*
What are the top paying jobs for my role?
-top 10 data scientist jobs
-work from home / available remotely
-focus on job postings with specified salaries
*/


SELECT
    job_title,
    company_dim.name AS company_name,
    job_country,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
WHERE 
    job_work_from_home IS true AND 
    job_title_short = 'Data Scientist' AND
    salary_year_avg is NOT null
ORDER BY 
    salary_year_avg desc
LIMIT 10
