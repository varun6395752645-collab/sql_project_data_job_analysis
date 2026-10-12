SELECT 
    skill_id ,
    count(*) AS skill_count
FROM 
    skills_job_dim AS skill_to_job
INNER JOIN
    job_postings_fact AS job_postings ON job_postings.job_id=skill_to_job.job_id
WHERE
    job_postings.job_work_from_home=True
GROUP BY
    skill_id
    
WITH remote_job_skill AS (
    SELECT 
        skill_id,
        count(*) AS skill_count
    FROM 
        skills_job_dim AS skill_to_job
    INNER JOIN
        job_postings_fact AS job_postings ON job_postings.job_id=skill_to_job.job_id
    WHERE
        job_postings.job_work_from_home=True
    GROUP BY
        skill_id
)

SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skill
INNER JOIN skills_dim AS skills ON skills.skill_id=remote_job_skill.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;


