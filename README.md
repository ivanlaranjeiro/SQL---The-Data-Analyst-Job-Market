# Introduction
The data job market is constantly shifting and understanding it requires more than numbers — it demands clarity.
Focusing on data analyst roles, this project explores top‑paying jobs, the skills employers value most and where high demand truly aligns with high salary.

Curious about the logic behind the insights?
Check out the SQL queries here: [project_sql folder](/project_sql/)

# Background
This project grew from a simple need: to understand the data analyst job market with more clarity while improving my SQL skills.
By identifying top‑paid roles and the skills employers consistently seek, the goal is to make the search for meaningful opportunities more straightforward — for myself and for anyone navigating the same path.

The dataset comes from my SQL Course {https://lukebarousse.com/sql}, offering structured insights into job titles, salaries, locations and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
To understand the data analyst job market with precision, I relied on a set of tools that shaped both the process and the insights:

- **SQL**: A language that turns scattered information into structure, helping uncover insights that aren’t obvious at first glance.
- **PostgreSQL**: A reliable and flexible database system, ideal for managing and exploring the job posting dataset.
- **Visual Studio Code**: My workspace for writing, testing and refining SQL queries with clarity and control.
- **Git & GitHub**: A way to document the journey, preserve each step and share the work with anyone seeking similar clarity.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
I identified the top‑paying remote data analyst roles by filtering out postings without salary information and ranking the highest offers.
This reveals where real compensation meets real opportunity, highlighting the strongest positions in the market.

```sql
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
```

Here are some insights about the top paying jobs:
1. **Exceptional salaries come from highly specialized analyst roles** - The $650k Mantys role shows that niche, high‑impact analyst positions can far exceed industry norms.

2. **Leadership positions consistently drive compensation upward** - Director and Principal titles at Meta, AT&T, and SmartAsset all exceed $180k–$330k.

3. **Top-paying analyst roles appear across diverse industries** - Companies from tech (Meta, Pinterest) to telecom (AT&T) and healthcare (UCLA) offer premium salaries.

4. **Remote‑friendly roles dominate the highest salary brackets** - Nearly all top-paying jobs are listed as “Anywhere,” reflecting strong demand for distributed analytics talent.

5. **Marketing, insights, and performance analytics roles command premium pay** - Jobs focused on strategic decision-making—like Marketing Analytics and AV Performance—consistently exceed $180k.

| Job ID  | Job Title                                      | Salary Avg | Company                                   |
|---------|------------------------------------------------|------------|--------------------------------------------|
| 226942  | Data Analyst                                   | 650000.0   | Mantys                                     |
| 547382  | Director of Analytics                          | 336500.0   | Meta                                       |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       |
| 99305   | Data Analyst, Marketing                        | 232423.0   | Pinterest Job Advertisements               |
| 1021647 | Data Analyst (Hybrid/Remote)                   | 217000.0   | Uclahealthcareers                          |
| 168310  | Principal Data Analyst (Remote)                | 205000.0   | SmartAsset                                 |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                |
| 310660  | Principal Data Analyst, AV Performance Analysis| 189000.0   | Motional                                   |
| 1749593 | Principal Data Analyst                        | 186000.0   | SmartAsset                                 |
| 387860  | ERM Data Analyst                              | 184000.0   | Get It Recruit - Information Technology     |


### 2. Top Paying Job Skills
I analyzed the top‑paying data analyst roles and mapped the specific skills each one requires. This reveals which capabilities consistently align with high salaries, helping job seekers focus on what truly moves the needle.

```sql
WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills

FROM 
    top_paying_jobs
INNER JOIN skills_job_dim
ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY
    salary_year_avg DESC
```
Here are some insights about the top paying skills:
1. **High‑earning roles blend analytics with engineering** - They combine SQL and Python with cloud tools like AWS, Azure, and Snowflake.

2. **Cloud data platforms strongly boost compensation** - Skills such as Snowflake, Databricks, and AWS appear consistently in $180k+ roles.

3. **Advanced Python tooling signals senior analytical capability** - Pandas, NumPy, PySpark, and Jupyter show deeper technical expectations beyond basic scripting.

4. **BI tools remain essential even at director‑level salaries** - Tableau and Power BI appear across nearly all top‑paying positions.

5. **Collaboration and DevOps tools indicate leadership‑oriented roles** - Skills like Gitlab, Bitbucket, Jira and Confluence appear in Principal and Director roles.

| Job ID  | Job Title                                      | Salary Avg | Company                                   | Skill       |
|---------|------------------------------------------------|------------|--------------------------------------------|-------------|
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | sql         |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | python      |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | r           |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | azure       |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | databricks  |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | aws         |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | pandas      |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | pyspark     |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | jupyter     |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | excel       |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | tableau     |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | power bi    |
| 552322  | Associate Director- Data Insights              | 255829.5   | AT&T                                       | powerpoint  |
| 99305   | Data Analyst, Marketing                        | 232423.0   | Pinterest Job Advertisements               | sql         |
| 99305   | Data Analyst, Marketing                        | 232423.0   | Pinterest Job Advertisements               | python      |
| 99305   | Data Analyst, Marketing                        | 232423.0   | Pinterest Job Advertisements               | r           |
| 99305   | Data Analyst, Marketing                        | 232423.0   | Pinterest Job Advertisements               | hadoop      |
| 99305   | Data Analyst, Marketing                        | 232423.0   | Pinterest Job Advertisements               | tableau     |
| 1021647 | Data Analyst (Hybrid/Remote)                   | 217000.0   | Uclahealthcareers                          | sql         |
| 1021647 | Data Analyst (Hybrid/Remote)                   | 217000.0   | Uclahealthcareers                          | crystal     |
| 1021647 | Data Analyst (Hybrid/Remote)                   | 217000.0   | Uclahealthcareers                          | oracle      |
| 1021647 | Data Analyst (Hybrid/Remote)                   | 217000.0   | Uclahealthcareers                          | tableau     |
| 1021647 | Data Analyst (Hybrid/Remote)                   | 217000.0   | Uclahealthcareers                          | flow        |
| 168310  | Principal Data Analyst (Remote)                | 205000.0   | SmartAsset                                 | sql         |
| 168310  | Principal Data Analyst (Remote)                | 205000.0   | SmartAsset                                 | python      |
| 168310  | Principal Data Analyst (Remote)                | 205000.0   | SmartAsset                                 | go          |
| 168310  | Principal Data Analyst (Remote)                | 205000.0   | SmartAsset                                 | snowflake   |
| 168310  | Principal Data Analyst (Remote)                | 205000.0   | SmartAsset                                 | pandas      |
| 168310  | Principal Data Analyst (Remote)                | 205000.0   | SmartAsset                                 | numpy       |
| 168310  | Principal Data Analyst (Remote)                | 205000.0   | SmartAsset                                 | excel       |
| 168310  | Principal Data Analyst (Remote)                | 205000.0   | SmartAsset                                 | tableau     |
| 168310  | Principal Data Analyst (Remote)                | 205000.0   | SmartAsset                                 | gitlab      |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | sql         |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | python      |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | azure       |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | aws         |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | oracle      |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | snowflake   |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | tableau     |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | power bi    |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | sap         |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | jenkins     |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | bitbucket   |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | atlassian   |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | jira        |
| 731368  | Director, Data Analyst - HYBRID                | 189309.0   | Inclusively                                | confluence  |
| 310660  | Principal Data Analyst, AV Performance Analysis| 189000.0   | Motional                                   | sql         |
| 310660  | Principal Data Analyst, AV Performance Analysis| 189000.0   | Motional                                   | python      |
| 310660  | Principal Data Analyst, AV Performance Analysis| 189000.0   | Motional                                   | r           |
| 310660  | Principal Data Analyst, AV Performance Analysis| 189000.0   | Motional                                   | git         |
| 310660  | Principal Data Analyst, AV Performance Analysis| 189000.0   | Motional                                   | bitbucket   |
| 310660  | Principal Data Analyst, AV Performance Analysis| 189000.0   | Motional                                   | atlassian   |
| 310660  | Principal Data Analyst, AV Performance Analysis| 189000.0   | Motional                                   | jira        |
| 310660  | Principal Data Analyst, AV Performance Analysis| 189000.0   | Motional                                   | confluence  |
| 1749593 | Principal Data Analyst                        | 186000.0   | SmartAsset                                 | sql         |
| 1749593 | Principal Data Analyst                        | 186000.0   | SmartAsset                                 | python      |
| 1749593 | Principal Data Analyst                        | 186000.0   | SmartAsset                                 | go          |
| 1749593 | Principal Data Analyst                        | 186000.0   | SmartAsset                                 | snowflake   |
| 1749593 | Principal Data Analyst                        | 186000.0   | SmartAsset                                 | pandas      |
| 1749593 | Principal Data Analyst                        | 186000.0   | SmartAsset                                 | numpy       |
| 1749593 | Principal Data Analyst                        | 186000.0   | SmartAsset                                 | excel       |
| 1749593 | Principal Data Analyst                        | 186000.0   | SmartAsset                                 | tableau     |
| 1749593 | Principal Data Analyst                        | 186000.0   | SmartAsset                                 | gitlab      |
| 387860  | ERM Data Analyst                              | 184000.0   | Get It Recruit - Information Technology     | sql         |
| 387860  | ERM Data Analyst                              | 184000.0   | Get It Recruit - Information Technology     | python      |
| 387860  | ERM Data Analyst                              | 184000.0   | Get It Recruit - Information Technology     | r           |


### 3. Top Demanded Skills
I analyzed all job postings to identify the five skills most consistently demanded for data analyst roles. This highlights the core capabilities the market values most, helping job seekers focus on skills that reliably open doors.

```sql
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
```
Here's the breakdown of the results for top demanded skills:
1. **SQL dominates the entire data analyst job market** - It is the single most requested skill, forming the backbone of nearly all analytics roles.

2. **Excel remains a core requirement across industries** - Its massive demand shows that spreadsheet analysis is still central to daily analyst work.

3. **Python drives the shift toward technical and automated analytics** - Its high demand reflects the growing need for scripting, data processing and advanced analysis.

4. **Tableau leads the visualization landscape for modern analysts** - Its strong demand highlights the importance of turning data into clear, actionable insights.

5. **Power BI is a close second in the visualization tools** - Its demand shows widespread adoption in business‑focused and operational analytics teams.

| Skill     | Demand Count |
|-----------|--------------|
| SQL       | 92,628       |
| Excel     | 67,031       |
| Python    | 57,326       |
| Tableau   | 46,554       |
| Power BI  | 39,468       |

### 4. Top Paying Skills
I analyzed the average salaries tied to each skill across data analyst roles with defined pay ranges. This reveals which skills consistently command higher compensation, helping job seekers prioritize the most financially rewarding capabilities.

```sql
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
```
Here's the breakdown of the results for top paying skills:
1. **High‑paying analyst roles blend analytics with engineering** - Skills like Terraform, Puppet, Ansible, VMware, Gitlab, Bitbucket.

2. **Machine‑learning frameworks strongly boost salaries** - Skills like PyTorch, TensorFlow, Keras, MXNet, Hugging Face.

3. **Blockchain and Web3 skills command premium pay** - Solidity stands out with very high compensation.

4. **Cloud automation and infrastructure tools drive compensation upward** - Terraform, VMware, Airflow, Kafka, Cassandra.

5. **AutoML platforms reward analysts who support model deployment** - DataRobot appears with a very high average salary.

6. **Backend and high‑performance languages appear in top‑earning roles** - Golang, Perl, Scala.

7. **Distributed systems and big‑data tools correlate with higher pay** - Kafka, Cassandra, Airflow.

8. **Collaboration and DevOps tools signal senior, well‑paid positions** - Gitlab, Bitbucket, Atlassian, SVN.

9. **Advanced ML libraries show demand for analysts who work near data science** - PyTorch, TensorFlow, Keras, MXNet, Hugging Face.

10. **Specialized statistical tools indicate niche, high‑value analytics roles** - dplyr (from the R ecosystem).

| Skill         | Avg Salary |
|---------------|------------|
| svn           | 400,000    |
| solidity      | 179,000    |
| couchbase     | 160,515    |
| datarobot     | 155,486    |
| golang        | 155,000    |
| mxnet         | 149,000    |
| dplyr         | 147,633    |
| vmware        | 147,500    |
| terraform     | 146,734    |
| twilio        | 138,500    |
| gitlab        | 134,126    |
| kafka         | 129,999    |
| puppet        | 129,820    |
| keras         | 127,013    |
| pytorch       | 125,226    |
| perl          | 124,686    |
| ansible       | 124,370    |
| hugging face  | 123,950    |
| tensorflow    | 120,647    |
| cassandra     | 118,407    |
| notion        | 118,092    |
| atlassian     | 117,966    |
| bitbucket     | 116,712    |
| airflow       | 116,387    |
| scala         | 115,480    |

### 5. Optimal Skills
I combined demand and salary data to identify the skills that offer both stability and strong financial return for remote data analyst roles. This highlights the strategic capabilities worth investing in — the ones that consistently deliver security and high compensation.

```sql
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary

FROM 
    job_postings_fact

INNER JOIN skills_job_dim 
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE

GROUP BY
    skills_dim.skill_id,
    skills_dim.skills

HAVING
    COUNT(skills_job_dim.job_id) > 10

ORDER BY
    demand_count DESC,
    avg_salary DESC

LIMIT 50
```

Here's the breakdown of the results for most optimal skills to learn:
1. **SQL is the foundation of all analyst roles** - It has the highest demand and remains the core skill for every data workflow.

2. **Python unlocks higher‑paying technical opportunities** - It offers strong salary growth and enables automation, modeling, and advanced analytics.

3. **BI tools like Tableau and Power BI drive business‑facing value** - They appear in high‑demand roles and are essential for communicating insights.

4. **Cloud data platforms significantly boost earning potential** - Skills like Snowflake, Azure, AWS, and BigQuery correlate with salaries above $110k.

5. **Specialized tools differentiate analysts in niche high‑value roles** - Skills like Looker, Hadoop, Spark, and Jira appear in fewer postings but offer strong salary advantages.

| Skill        | Demand Count | Avg Salary |
|--------------|--------------|------------|
| sql          | 398          | 97,237     |
| excel        | 256          | 87,288     |
| python       | 236          | 101,397    |
| tableau      | 230          | 99,288     |
| r            | 148          | 100,499    |
| power bi     | 110          | 97,431     |
| sas          | 63           | 98,902     |
| sas          | 63           | 98,902     |
| powerpoint   | 58           | 88,701     |
| looker       | 49           | 103,795    |
| word         | 48           | 82,576     |
| snowflake    | 37           | 112,948    |
| oracle       | 37           | 104,534    |
| sql server   | 35           | 97,786     |
| azure        | 34           | 111,225    |
| aws          | 32           | 108,317    |
| sheets       | 32           | 86,088     |
| flow         | 28           | 97,200     |
| go           | 27           | 115,320    |
| spss         | 24           | 92,170     |
| vba          | 24           | 88,783     |
| hadoop       | 22           | 113,193    |
| jira         | 20           | 104,918    |
| javascript   | 20           | 97,587     |
| sharepoint   | 18           | 81,634     |
| java         | 17           | 106,906    |
| alteryx      | 17           | 94,145     |
| redshift     | 16           | 99,936     |
| ssrs         | 14           | 99,171     |
| bigquery     | 13           | 109,654    |
| nosql        | 13           | 101,414    |
| qlik         | 13           | 99,631     |
| spark        | 13           | 99,077     |
| outlook      | 13           | 90,077     |
| ssis         | 12           | 106,683    |
| confluence   | 11           | 114,210    |
| c++          | 11           | 98,958     |

# What I Learned
I deepened my technical foundation by working hands‑on with SQL, PostgreSQL, Visual Studio Code and GitHub for the first time, learning how to structure queries, manage databases and maintain clean version control throughout the project.


Regarding SQL I managed to:
- Master some complex queries: merging tables, sub-queries and WITH clauses.
- Got comfortable aggregating data with GROUP BY, COUNT() and AVG()
- And most importantly: was able to develop my real-world puzzle-solving skills turning questions into insightful SQL queries.

# Conclusions
### Insights
From the analysis we can conclude some general points:
1. **Top-Paying Data Analyst Jobs** - The highest-paying jobs for Data Analysts that allow remote work offer a wide range of salaries. Highest one at 650,000$ per year.
2. **Skills for Top-Paying Jobs** - SQL is still critical for the Highest-paying Data Analyst jobs.
3. **Most in Demand Skills** - SQL is also the most demanded skill in the Data Analyst job market.
4. **Skills with Higher Salary** - Specialized skills are associated with the highest average salaries, indicating a rise on salary for niche positions.
5. **Optimal Skills for Job Market Value** - SQL leads in demand and offers for a high average salary. Is the best skill in terms of safety and increased salary opportunities.

### Closing Thoughts
Beyond the technical tools, this project gave me a clearer view of the Data job market — understanding salary patterns, demand for specific skills and how technical capabilities translate into real opportunities for Data Analysts. In a nutshell, this project gave me technical foundations and insight into the Data Job Market.