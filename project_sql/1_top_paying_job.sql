/*
What are the top paying jobs for my role?
-top 10 data analyst jobs
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
    job_title_short = 'Data Analyst' AND
    salary_year_avg is NOT null
ORDER BY 
    salary_year_avg desc
LIMIT 10


--junior data analyst--
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
    job_title_short = 'Data Analyst' AND
    job_title like '%junior%',
ORDER BY 
    salary_year_avg desc
LIMIT 10