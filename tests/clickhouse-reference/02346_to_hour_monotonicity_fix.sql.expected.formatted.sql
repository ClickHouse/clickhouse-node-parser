CREATE TABLE test_tz_hour
(
    t DateTime,
    x String
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY toYYYYMMDD(t);

SELECT
    toHour(toTimeZone(t, 'UTC')) AS toHour_UTC,
    toHour(toTimeZone(t, 'Asia/Jerusalem')) AS toHour_Israel,
    count()
FROM test_tz_hour
WHERE toHour_Israel = 8
GROUP BY
    toHour_UTC,
    toHour_Israel;