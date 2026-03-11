SELECT
    equals(sum_bytes1, sum_bytes2),
    equals(avg_duration1, avg_duration2)
FROM
    (
        SELECT
            toStartOfHour(datetime) AS hour,
            sum(bytes) AS sum_bytes1,
            avg(duration) AS avg_duration1
        FROM video_log
        WHERE (toDate(hour) = '2022-07-22')
            AND (device_id = '100')
        GROUP BY hour
    )
LEFT JOIN (
        SELECT
            hour,
            sum_bytes AS sum_bytes2,
            avg_duration AS avg_duration2
        FROM video_log_result
    )
    USING (hour)
SETTINGS joined_subquery_requires_alias = 0;