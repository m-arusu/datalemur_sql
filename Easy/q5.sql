# Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. Write a query to get the number of companies that have posted duplicate job listings.
# Clarification: duplicate job listings refer to two jobs at the same company with the same title and description.

SELECT COUNT(DISTINCT company_id) AS co_w_duplicate_jobs
FROM (
  SELECT
    company_id,
    title,
    description,
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description) AS jobs_grouped
WHERE job_count > 1;