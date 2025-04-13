/*
Which top 5 skills are most in demand right now on the market for Data analyst?
What are the differences between jobs from home and all the jobs?
Why? it provides the insight in the job market.
*/


WITH skills_of_job_from_home AS (
SELECT
    skills_job_dim.skill_id,
    count (*) AS skill_count 
FROM 
    skills_job_dim
LEFT JOIN job_postings_fact ON skills_job_dim.job_id=job_postings_fact.job_id
WHERE
    job_postings_fact.job_work_from_home = TRUE AND
    job_postings_fact.job_title_short = 'Data Analyst' 
GROUP BY
    skill_id
)

SELECT
    skills,
    skills_of_job_from_home.skill_count
FROM
    skills_of_job_from_home
LEFT JOIN skills_dim ON skills_of_job_from_home.skill_id = skills_dim.skill_id
ORDER BY skill_count DESC
LIMIT 5

---A bit shorter query for all Data Analyst jobs---

SELECT
    count(skills_job_dim.job_id) AS skill_count,
    skills
FROM 
    skills_job_dim
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
INNER JOIN job_postings_fact ON skills_job_dim.job_id=job_postings_fact.job_id
WHERE
    job_postings_fact.job_title_short='Data Analyst'
GROUP BY
    skills
ORDER BY 
    skill_count DESC
LIMIT 5

/*Turns out that there is no difference 
between jobs from home and on site jobs for data analyst
Top 5 needed skills for both are: 
SQL, excel, python, tableau and power bi
*/