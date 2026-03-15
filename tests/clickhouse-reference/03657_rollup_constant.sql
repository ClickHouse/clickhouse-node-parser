CREATE TABLE my_first_table
(
    user_id UInt32,
    job_id UInt32,
    message String,
    timestamp DateTime,
    metric Float32
)
ENGINE = MergeTree()
PRIMARY KEY (user_id, timestamp);
SET enable_analyzer = 1;
SELECT 1 AS constant, user_id, job_id, sum(metric)
FROM my_first_table
GROUP BY constant, user_id, job_id WITH ROLLUP
ORDER BY constant = 0, user_id = 0, job_id = 0, constant, user_id, job_id;
