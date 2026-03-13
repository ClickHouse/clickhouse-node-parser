-- We are not interested in the result of this query, but it should not produce a logical error.
SELECT
    avg_duration1,
    avg_duration1 = avg_duration2
FROM
    (
        SELECT
            sum(bytes),
            hour,
            toStartOfHour(datetime) AS hour,
            avg(duration) AS avg_duration1
        FROM video_log
        GROUP BY hour
        WITH ROLLUP
        WITH TOTALS
    )
LEFT JOIN (
        SELECT
            hour,
            sum_bytes AS sum_bytes2,
            avg_duration AS avg_duration2
        FROM video_log_result__fuzz_0
    )
    USING (hour)
SETTINGS joined_subquery_requires_alias = 0
FORMAT Null;