SELECT 1 AS constant, user_id, job_id, sum(metric)
FROM my_first_table
GROUP BY constant, user_id, job_id WITH ROLLUP
ORDER BY constant = 0, user_id = 0, job_id = 0, constant, user_id, job_id;
