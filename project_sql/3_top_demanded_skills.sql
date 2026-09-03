/*
Question: What are the most in-demand skills for Data Analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst
- Focus on all job postings
- Why? Retrieves the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable skills for job seekers.
  */

SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count

FROM 
    job_postings_fact
INNER JOIN skills_job_dim 
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_postings_fact.job_title_short = 'Data Analyst'

GROUP BY
    skills_dim.skills

ORDER BY
    demand_count DESC

LIMIT 5

/*
Here's the breakdown of the results for top demanded skills:
1. SQL dominates the entire data analyst job market - 
   It is the single most requested skill, forming the backbone of nearly all analytics roles.

2. Excel remains a core requirement across industries -
   Its massive demand shows that spreadsheet analysis is still central to daily analyst work.

3. Python drives the shift toward technical and automated analytics -  
   Its high demand reflects the growing need for scripting, data processing, and advanced analysis.

4. Tableau leads the visualization landscape for modern analysts -  
   Its strong demand highlights the importance of turning data into clear, actionable insights.

5. Power BI is rapidly expanding in enterprise environments - 
   Its rising demand shows widespread adoption in business‑focused and operational analytics teams.

[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
*/