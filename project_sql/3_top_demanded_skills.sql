/*
Question: What are the most in-demand skills for business analysts?
- Join job postings to innger join table similar to query 2
- Identify the top 5 in-demand skills for a business analyst
- Focus on all job postings
- Why? Retreives the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job sekers
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
     INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
     INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5


/*
This following query replicates the above but is used to find the most
in-demand skills for business analysts when working remotely with an
extra WHERE clause

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
     INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
     INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
    AND job_work_from_home = True
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5