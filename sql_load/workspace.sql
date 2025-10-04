CREATE TABLE January_Jobs as
select *
from job_postings_fact
where EXTRACT(month from job_posted_date) = 1;

CREATE TABLE Febuary_Jobs as
select *
from job_postings_fact
where EXTRACT(month from job_posted_date) = 2;

CREATE TABLE March_Jobs as
select *
from job_postings_fact
where EXTRACT(month from job_posted_date) = 3;

select *
from job_postings_fact
where job_location like '%New York%';

select 
    job_title_short,
    job_location,
    case 
        when job_location = 'Anywhere' then 'Remote'
        when job_location in ('New York, NY', 'New York') then 'Local'
        else 'onsite'
    end as Location_category
from job_postings_fact;



select 
    count(job_id) as number_of_jobs,
    case 
        when job_location = 'Anywhere' then 'Remote'
        when job_location in ('New York, NY', 'New York') then 'Local'
        else 'onsite'
    end as Location_category
from job_postings_fact
where job_title_short = 'Data Analyst'
group by Location_category
order by number_of_jobs desc;


with job_openings as (
 select 
   company_id,
   count(company_id) as open_jobs
 from job_postings_fact
 group by company_id
)

select o.company_id,
       o.open_jobs,
       c.name as company_name
from job_openings as o 
left join company_dim as c  on
o.company_id = c.company_id 
order by o.open_jobs desc
limit 10;


/*
Top 5 skills for Remote Data analyst jobs openings
*/

with remote_jobs_skills as(
    select 
          s.skill_id,
          count(*) as skill_count
    from job_postings_fact as j inner join skills_job_dim as s on j.job_id = s.job_id
    where j.job_work_from_home = True And j.job_title_short = 'Data Analyst'
    group by s.skill_id
)

select 
    r.skill_id,
    r.skill_count,
    s.skills 
from remote_jobs_skills as r 
left join skills_dim as s on r.skill_id = s.skill_id
order by r.skill_count desc
limit 5;


/*
Union all Examples
*/
SELECT 
    qrtr_jobs.job_title_short,
    qrtr_jobs.job_location,
    qrtr_jobs.job_via,
    qrtr_jobs.job_posted_date::date,
    qrtr_jobs.salary_year_avg
from(
   select * 
   from january_jobs
union all 
   select *
   from febuary_jobs
union all
   select *
   from march_jobs
) as qrtr_jobs
where qrtr_jobs.salary_year_avg > 70000
and qrtr_jobs.job_title_short = 'Data Analyst'
order by qrtr_jobs.salary_year_avg desc;