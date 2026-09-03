WITH job_postings_q1 AS
    (
    SELECT 
        job_id,
        job_posted_date 
    FROM january_jobs
    UNION ALL
    SELECT
        job_id,
        job_posted_date
    FROM february_jobs
    UNION ALL
    SELECT 
        job_id,
        job_posted_date
    FROM march_jobs
    ),

monthly_skill_demand AS
    (
    SELECT
        skills_dim.skills,
        EXTRACT(YEAR FROM job_postings_q1.job_posted_date) AS year,
        EXTRACT(MONTH FROM job_postings_q1.job_posted_date) AS month,
        COUNT(DISTINCT job_postings_q1.job_id) AS amount_in_postings

    FROM
        job_postings_q1
    
    INNER JOIN skills_job_dim
    ON job_postings_q1.job_id = skills_job_dim.job_id

    INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id

    GROUP BY
        skills_dim.skills,
        year,
        month
    )

SELECT *
FROM monthly_skill_demand
ORDER BY
    skills,
    year,
    month