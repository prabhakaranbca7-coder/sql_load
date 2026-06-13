select skills_dim.skill_id, 
skills_dim.skills,
round(avg(job_postings_fact.salary_year_avg),0) as avg_salary,
count(skills_job_dim.job_id) as demand_count
 FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
job_title_short = 'Data Analyst'and 
salary_year_avg is not NULL and 
job_work_from_home = TRUE
GROUP BY skills_dim.skill_id
having count (skills_job_dim.job_id) > 10
order BY
avg_salary DESC,
demand_count DESC
limit 25;
