SELECT
    a,
    b
FROM test_time
WHERE a > 12435
    AND a < 12437;

SELECT
    floor(CAST(a, 'Int32') / 60) AS minute_bucket,
    count(*) AS total_records,
    min(a) AS min_time,
    max(a) AS max_time,
    groupArray(b) AS all_b_values
FROM test_time
WHERE (a > 12435)
    AND (a < 12437)
GROUP BY minute_bucket
ORDER BY minute_bucket ASC;