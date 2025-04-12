/*
What are the skills requred for this top paying jobs (and alternatively for my type of jobs)

*/
WITH top_paying_jobs AS (SELECT
    job_id,
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
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

/*
The top 10 most frequently required skills in the dataset are:
SQL – 8 mentions
Python – 7 mentions
Tableau – 6 mentions
R – 4 mentions
Snowflake, Pandas, Excel – each with 3 mentions
Azure, Bitbucket, Go – each with 2 mentions
These results suggest a strong demand for data-related skills, particularly SQL, Python, and Tableau.
*/


--junior data analyst--
WITH junior_data_analyst AS (SELECT
    job_id,
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
    job_title like '%junior%' AND
    (job_country = 'Italy' OR job_country = 'Slovenia')
ORDER BY 
    job_id desc
LIMIT 10)

SELECT
    junior_data_analyst.*,
    skills
FROM
    junior_data_analyst
INNER JOIN skills_job_dim ON junior_data_analyst.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id