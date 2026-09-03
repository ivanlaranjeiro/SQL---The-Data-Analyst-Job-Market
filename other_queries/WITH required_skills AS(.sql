WITH required_skills AS(
    SELECT
        company_dim.name AS company_name,
        COUNT(DISTINCT skills_job_dim.skill_id) AS unique_skills_count
    
    FROM
        skills_job_dim

    LEFT JOIN job_postings_fact
    ON skills_job_dim.job_id = job_postings_fact.job_id

    LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id

    GROUP BY
        company_dim.name
)

WITH max_salary AS (
    SELECT 
        job_postings_fact.company_id,
        MAX(salary_year_avg) AS max_salary

    FROM
        job_postings_fact
    
    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id

    WHERE 
        skills_job_dim.skill_id IS NOT NULL

    GROUP BY
        company_id
)



SELECT *
FROM company_dim
Limit 10

SELECT *
FROM skills_job_dim
Limit 10

SELECT *
FROM job_postings_fact
LIMIT 10

