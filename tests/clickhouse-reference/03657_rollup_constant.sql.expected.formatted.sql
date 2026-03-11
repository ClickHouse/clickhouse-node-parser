SELECT
    1 AS constant,
    user_id,
    job_id,
    sum(metric)
FROM my_first_table
GROUP BY
    constant,
    user_id,
    job_id
WITH ROLLUP
ORDER BY
    constant = 0 ASC,
    user_id = 0 ASC,
    job_id = 0 ASC,
    constant ASC,
    user_id ASC,
    job_id ASC;