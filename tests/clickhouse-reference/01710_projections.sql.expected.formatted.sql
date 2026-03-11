SELECT *
FROM projection_test;

SELECT
    toStartOfMinute(datetime) AS dt_m,
    countIf(first_time = 0)
FROM
    projection_test
INNER JOIN (
        SELECT 1
    ) AS x
    ON 1
WHERE domain = '1'
GROUP BY dt_m
ORDER BY dt_m ASC;

SELECT
    toStartOfMinute(datetime) AS dt_m,
    countIf(first_time = 0) / count(),
    avg((kbytes * 8) / duration)
FROM projection_test
WHERE domain = '1'
GROUP BY dt_m
ORDER BY dt_m ASC;

SELECT
    toStartOfMinute(datetime) AS dt_m,
    countIf(first_time = 0) / count(),
    avg((kbytes * 8) / duration)
FROM projection_test
PREWHERE domain_alias = 3
WHERE domain = '1'
GROUP BY dt_m
ORDER BY dt_m ASC;

SELECT
    toStartOfMinute(datetime) AS dt_m,
    countIf(first_time = 0) / count(),
    avg((kbytes * 8) / duration)
FROM projection_test
PREWHERE domain_alias = 1
WHERE domain = '1'
GROUP BY dt_m
ORDER BY dt_m ASC;

SELECT
    toStartOfMinute(datetime) AS dt_m,
    count(),
    sum(block_count) / sum(duration),
    avg(block_count / duration)
FROM projection_test
GROUP BY dt_m
ORDER BY dt_m ASC;

SELECT
    toStartOfMinute(datetime) AS dt_m,
    sum(buffer_time) / sum(duration),
    avg(buffer_time / duration),
    sum(valid_bytes) / sum(total_bytes),
    sum(completed_bytes) / sum(total_bytes),
    sum(fixed_bytes) / sum(total_bytes),
    sum(force_bytes) / sum(total_bytes),
    sum(valid_bytes) / sum(total_bytes)
FROM projection_test
WHERE domain IN ('12', '14')
GROUP BY dt_m
ORDER BY dt_m ASC;

SELECT
    toStartOfMinute(datetime) AS dt_m,
    domain,
    sum(retry_count) / sum(duration),
    avg(retry_count / duration),
    countIf(block_count > 0) / count(),
    countIf(first_time = 0) / count()
FROM projection_test
GROUP BY
    dt_m,
    domain
HAVING domain = '19'
ORDER BY
    dt_m ASC,
    domain ASC;

SELECT
    toStartOfHour(toStartOfMinute(datetime)) AS dt_h,
    uniqHLL12(x_id),
    uniqHLL12(y_id)
FROM projection_test
GROUP BY dt_h
ORDER BY dt_h ASC;

SELECT
    2,
    -1
FROM projection_test
PREWHERE domain_alias = 1.
WHERE domain = NULL
GROUP BY -9223372036854775808
ORDER BY
    countIf(first_time = 0) / count(-2147483649) DESC,
    1048576 DESC;

SELECT max(key)
FROM projection_without_key;