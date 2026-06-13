with top_paying_jobs AS(
select 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
from 
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
where 
job_title_short = 'Data Analyst' and
job_location = 'Anywhere' and
salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
limit 10
)
select top_paying_jobs.*,
skills
from top_paying_jobs
Inner JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
Order by 
salary_year_avg DESC