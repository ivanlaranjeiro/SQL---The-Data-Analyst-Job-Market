/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment opportunities
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name

FROM
    job_postings_fact

LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id

WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC

LIMIT 10

/* Here are some insights about the top paying jobs:
1. Exceptional salaries come from highly specialized analyst roles -  
   The $650k Mantys role shows that niche, high‑impact analyst positions can far exceed industry norms.

2. Leadership positions consistently drive compensation upward -
   Director and Principal titles at Meta, AT&T, and SmartAsset all exceed $180k–$330k.

3. Top-paying analyst roles appear across diverse industries - 
   Companies from tech (Meta, Pinterest) to telecom (AT&T) and healthcare (UCLA) offer premium salaries.

4. Remote‑friendly roles dominate the highest salary brackets - 
   Nearly all top-paying jobs are listed as “Anywhere,” reflecting strong demand for distributed analytics talent.

5. Marketing, insights, and performance analytics roles command premium pay - 
   Jobs focused on strategic decision-making—like Marketing Analytics and AV Performance—consistently exceed $180k.