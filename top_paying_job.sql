
/*Question: what skills are required for the top_paying data analyst jobs?
- Use the top 10 highest-paying data analyst jobs from first query 
- Add the specific skills required for these roles
- why? It provide a detailed look at which high-paying jobs demand certain skills,
  helping job seekar understanding which skills to develop that align with top salaries    
*/

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
 
