/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills_dim.skills,
    ROUND (AVG(job_postings_fact.salary_year_avg), 2) AS avg_salary 
FROM 
    job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN  skills_dim 
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE 
-- AND search_location = 'India'
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25;

/*
  Top-paying skills:

- PySpark ($208k) → clear #1. Then Bitbucket ($189k), Couchbase/Watson (~$161k), DataRobot ($155k), GitLab ($155k).

- Strong band ($145–154k): Swift, Jupyter, pandas, Elasticsearch, Go, NumPy, Databricks.

- Solid tier ($122–136k): Linux, Kubernetes, Atlassian, Twilio, Airflow, scikit-learn, Jenkins, Notion, Scala, PostgreSQL, GCP, MicroStrategy.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172.25"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189154.50"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.00"
  },
  {
    "skills": "watson",
    "avg_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.50"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500.00"
  },
  {
    "skills": "swift",
    "avg_salary": "153750.00"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152776.50"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821.33"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000.00"
  },
  {
    "skills": "golang",
    "avg_salary": "145000.00"
  },
  {
    "skills": "numpy",
    "avg_salary": "143512.50"
  },
  {
    "skills": "databricks",
    "avg_salary": "141906.60"
  },
  {
    "skills": "linux",
    "avg_salary": "136507.50"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500.00"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131161.80"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000.00"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103.00"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781.25"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436.33"
  },
  {
    "skills": "notion",
    "avg_salary": "125000.00"
  },
  {
    "skills": "scala",
    "avg_salary": "124903.00"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123878.75"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500.00"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619.25"
  }
]
*/