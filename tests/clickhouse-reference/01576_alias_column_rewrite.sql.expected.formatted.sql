SELECT COUNT() = 10
FROM test_table
WHERE day = '2020-01-01'
SETTINGS max_rows_to_read = 10;

SELECT t = '2020-01-03'
FROM (
        SELECT day AS t
        FROM test_table
        WHERE t = '2020-01-03'
        GROUP BY t
        SETTINGS max_rows_to_read = 10
    );

SELECT COUNT() = 10
FROM test_table
WHERE day = '2020-01-01'
UNION ALL
SELECT 1
FROM numbers(1)
SETTINGS max_rows_to_read = 11;

SELECT COUNT() = 0
FROM (
        SELECT
            toDate('2019-01-01') AS day,
            day AS t
        FROM test_table
        PREWHERE t = '2020-01-03'
        WHERE t = '2020-01-03'
        GROUP BY t
    );

SELECT day = '2020-01-03'
FROM
    (
        SELECT toDate('2020-01-03') AS day
        FROM numbers(1)
    ) AS a
INNER JOIN (
        SELECT day
        FROM test_table
        WHERE day = '2020-01-03'
        GROUP BY day
    ) AS b
    ON a.day = b.day
SETTINGS max_rows_to_read = 11;

SELECT day = '2020-01-01'
FROM
    (
        SELECT day
        FROM test_table
        WHERE day = '2020-01-01'
        GROUP BY day
    ) AS a
INNER JOIN (
        SELECT toDate('2020-01-01') AS day
        FROM numbers(1)
    ) AS b
    ON a.day = b.day
SETTINGS max_rows_to_read = 11;

SELECT COUNT() = 10
FROM test_table
WHERE day1 = '2020-01-02'
SETTINGS max_rows_to_read = 10;

SELECT t = '2020-01-03'
FROM (
        SELECT day1 AS t
        FROM test_table
        WHERE t = '2020-01-03'
        GROUP BY t
        SETTINGS max_rows_to_read = 10
    );

SELECT t = '2020-01-03'
FROM (
        SELECT day2 AS t
        FROM test_table
        WHERE t = '2020-01-03'
        GROUP BY t
        SETTINGS max_rows_to_read = 10
    );

SELECT COUNT() = 10
FROM test_table
WHERE day1 = '2020-01-03'
UNION ALL
SELECT 1
FROM numbers(1)
SETTINGS max_rows_to_read = 11;

SELECT COUNT() = 0
FROM (
        SELECT
            toDate('2019-01-01') AS day1,
            day1 AS t
        FROM test_table
        PREWHERE t = '2020-01-03'
        WHERE t = '2020-01-03'
        GROUP BY t
    );

SELECT day1 = '2020-01-04'
FROM test_table
PREWHERE day1 = '2020-01-04'
WHERE day1 = '2020-01-04'
GROUP BY day1
SETTINGS max_rows_to_read = 10;

SELECT count() == 10
FROM test_table
WHERE day = '2020-01-01';

SELECT
    sum(struct.key) == 30,
    sum(struct.value) == 30
FROM (
        SELECT
            struct.key,
            struct.value
        FROM
            test_table
        ARRAY JOIN struct
        WHERE day = '2020-01-01'
    );

-- lambda parameters in filter should not be rewrite
SELECT count() == 10
FROM test_table
WHERE arrayMap(day -> day + 1, [1,2,3])[1] = 2
    AND day = '2020-01-03';

SELECT COUNT() == 1
FROM test_index
WHERE key_uint32 = 1;

SELECT COUNT() == 1
FROM test_index
WHERE toUInt32(key_string) = 1;

SELECT sum(i)
FROM pd
GROUP BY dt_m
SETTINGS
    optimize_use_projections = 1,
    force_optimize_projection = 1;

SELECT
    sum(x),
    sum(y)
FROM t;