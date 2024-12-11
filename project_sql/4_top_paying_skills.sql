/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skills for Business Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Business Analysts and
    helps identify the most financially reqarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
     INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
     INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25

/*
This following query replicates the above but is used to find the top
skills based on salary for business analysts when working remotely

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
     INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
     INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25