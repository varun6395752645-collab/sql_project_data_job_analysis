SELECT *
FROM january_jobs;

SELECT *
FROM february_jobs;

SELECT *
FROM march_jobs;


SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs 

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs