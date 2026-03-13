SELECT
    n,
    j
FROM
    (
        SELECT number * 200000 AS n
        FROM numbers(5)
    ) AS nums
LEFT JOIN (
        SELECT
            number * 2 AS n,
            number AS j
        FROM numbers(1000000)
    ) AS js2
    USING (n); -- { serverError MEMORY_LIMIT_EXCEEDED }

SELECT
    n,
    j
FROM
    (
        SELECT number * 200000 AS n
        FROM numbers(5)
    ) AS nums
LEFT JOIN (
        SELECT
            number * 2 AS n,
            number AS j
        FROM numbers(1000000)
    ) AS js2
    USING (n)
SETTINGS max_bytes_in_join = 30000000; -- { serverError MEMORY_LIMIT_EXCEEDED }

SELECT
    n,
    j
FROM
    (
        SELECT number * 200000 AS n
        FROM numbers(5)
    ) AS nums
LEFT JOIN (
        SELECT
            number * 2 AS n,
            number AS j
        FROM numbers(1000000)
    ) AS js2
    USING (n)
ORDER BY n ASC
SETTINGS max_bytes_in_join = 10000000;

SELECT
    n,
    j
FROM
    (
        SELECT number * 200000 AS n
        FROM numbers(5)
    ) AS nums
LEFT JOIN (
        SELECT
            number * 2 AS n,
            number AS j
        FROM numbers(1000000)
    ) AS js2
    USING (n)
ORDER BY n ASC
SETTINGS max_rows_in_join = 100000;

SELECT
    n,
    j
FROM
    (
        SELECT number * 200000 AS n
        FROM numbers(5)
    ) AS nums
INNER JOIN (
        SELECT
            number * 2 AS n,
            number AS j
        FROM numbers(1000000)
    ) AS js2
    USING (n)
ORDER BY n ASC;