/*
Question: What are the top-paying business analyst jobs?
- Identify the top 20 highest-paying Business Analyst roles that are available remotely.
- Focus on job postings with specified salaries (remove null values).
- Why? Highlight the top-paying opportunities for Business Analysts, offering insights into employment opportunites
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact
     LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Business Analyst'
    AND job_work_from_home = True
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 20