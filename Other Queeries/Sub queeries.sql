SELECT
    company_dim.name,
    CASE
        WHEN job_postings_count.number_job_postings > 50 THEN 'Large'
        WHEN job_postings_count.number_job_postings >= 10 THEN 'Medium'
        ELSE 'Small'
    END AS company_size

    FROM(
        SELECT 
            company_id,
            COUNT(job_id) AS number_job_postings

        FROM job_postings_fact

        GROUP BY
            company_id
    ) AS job_postings_count

    INNER JOIN company_dim ON job_postings_count.company_id = company_dim.company_id

 