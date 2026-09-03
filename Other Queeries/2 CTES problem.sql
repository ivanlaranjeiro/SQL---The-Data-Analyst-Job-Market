WITH required_skills AS (
    SELECT 
        company_dim.name AS company_name,
        COUNT(DISTINCT skills_job_dim.skill_id) AS distinct_skills
    
    FROM company_dim

    LEFT JOIN job_postings_fact
    ON company_dim.company_id = job_postings_fact.company_id

    LEFT JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id

    GROUP BY
        company_dim.name
),

max_salary AS (
    SELECT
        company_dim.name AS company_name,
        MAX(job_postings_fact.salary_year_avg) AS highest_salary

    FROM 
        company_dim
    
    INNER JOIN job_postings_fact
    ON company_dim.company_id = job_postings_fact.company_id

    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id

    GROUP BY 
        company_dim.name
)

SELECT
    required_skills.company_name,
    distinct_skills,
    max_salary.highest_salary

    FROM 
        required_skills

    LEFT JOIN max_salary
    ON required_skills.company_name = max_salary.company_name;
