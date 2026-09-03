/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_salary

FROM 
    job_postings_fact
INNER JOIN skills_job_dim 
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL

GROUP BY
    skills_dim.skills

ORDER BY
    avg_salary DESC

LIMIT 25

/*

Here's the breakdown of the results for top paying skills:
1. High‑paying analyst roles blend analytics with engineering  
→ Skills like Terraform, Puppet, Ansible, VMware, Gitlab, Bitbucket.

2. Machine‑learning frameworks strongly boost salaries  
→ Skills like PyTorch, TensorFlow, Keras, MXNet, Hugging Face.

3. Blockchain and Web3 skills command premium pay  
→ Solidity stands out with very high compensation.

4. Cloud automation and infrastructure tools drive compensation upward  
→ Terraform, VMware, Airflow, Kafka, Cassandra.

5. AutoML platforms reward analysts who support model deployment  
→ DataRobot appears with a very high average salary.

6. Backend and high‑performance languages appear in top‑earning roles  
→ Golang, Perl, Scala.

7. Distributed systems and big‑data tools correlate with higher pay  
→ Kafka, Cassandra, Airflow.

8. Collaboration and DevOps tools signal senior, well‑paid positions  
→ Gitlab, Bitbucket, Atlassian, SVN.

9. Advanced ML libraries show demand for analysts who work near data science  
→ PyTorch, TensorFlow, Keras, MXNet, Hugging Face.

10. Specialized statistical tools indicate niche, high‑value analytics roles  
→ dplyr (from the R ecosystem).

[
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_salary": "115480"
  }
]
*/