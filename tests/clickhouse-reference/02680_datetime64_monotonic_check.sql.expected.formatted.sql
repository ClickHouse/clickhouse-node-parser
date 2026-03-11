SELECT
    toHour(toTimeZone(t, 'UTC')) AS toHour_UTC,
    toHour(toTimeZone(t, 'Asia/Jerusalem')) AS toHour_Israel,
    count()
FROM `02680_datetime64_monotonic_check`
WHERE toHour_Israel = 0
GROUP BY
    toHour_UTC,
    toHour_Israel;

SELECT toDateTime(timestamp, 'Asia/Jerusalem')
FROM `02680_datetime_monotonic_check_lc`
WHERE toHour(toDateTime(timestamp, 'Asia/Jerusalem')) = 2;