SELECT a
FROM t
FORMAT Null
SETTINGS log_comment = 'query_1';

SELECT s
FROM t
FORMAT Null
SETTINGS log_comment = 'query_2';

SELECT
    s,
    d
FROM t
FORMAT Null
SETTINGS log_comment = 'query_3';

SELECT
    a,
    s,
    d
FROM t
FORMAT Null
SETTINGS log_comment = 'query_4';

SELECT COUNT(*)
FROM t
WHERE a % 10 = 0
FORMAT Null
SETTINGS log_comment = 'query_5';

SELECT COUNT(*)
FROM t
WHERE a > 10101
FORMAT Null
SETTINGS log_comment = 'query_6', allow_experimental_projection_optimization = 0, optimize_use_implicit_projections = 0;

SELECT COUNT(*)
FROM t
WHERE a <= 10101
FORMAT Null
SETTINGS log_comment = 'query_7', allow_experimental_projection_optimization = 0, optimize_use_implicit_projections = 0;

SELECT
    a,
    s
FROM t
WHERE like(s, '1%')
ORDER BY a DESC
LIMIT 10
FORMAT Null
SETTINGS log_comment = 'query_8';

-- Just checking that the estimation is not too far off
SELECT format('{} {} {}', log_comment, compressed_bytes, statistics_input_bytes)
FROM (
        SELECT
            log_comment,
            ProfileEvents['ReadCompressedBytes'] AS compressed_bytes,
            ProfileEvents['RuntimeDataflowStatisticsInputBytes'] AS statistics_input_bytes
        FROM `system`.query_log
        WHERE (event_date >= yesterday())
            AND (event_time >= NOW() - toIntervalMinute(15))
            AND (current_database = currentDatabase())
            AND (like(log_comment, 'query_%'))
            AND (type = 'QueryFinish')
        ORDER BY event_time_microseconds ASC
    )
WHERE greatest(compressed_bytes, statistics_input_bytes) / least(compressed_bytes, statistics_input_bytes) > 2;