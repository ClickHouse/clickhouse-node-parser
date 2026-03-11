SELECT
    toDate(time, 'UTC') AS dt,
    min(toDateTime(time, 'UTC')),
    max(toDateTime(time, 'UTC')),
    sum(count)
FROM bad_date_time
WHERE toDate(time, 'UTC') = '2020-12-19'
GROUP BY dt;