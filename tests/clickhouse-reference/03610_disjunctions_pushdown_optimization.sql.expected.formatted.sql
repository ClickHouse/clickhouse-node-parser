-- We need to make sure that query plan creates the JOIN filter only with the optimization enabled, and WHERE filter in both cases
---------- CASE A ----------
SELECT '--- CASE A: plan (enabled) ---';

SELECT REGEXP_REPLACE(trimLeft(`explain`), '__set_Int32_\\d+_\\d+', '__set_Int32_UNIQ_ID')
FROM (
        EXPLAIN actions = 1
        SELECT
            t1.k,
            t1.a,
            t2.x
        FROM
            tp1 AS t1
        INNER JOIN tp2 AS t2
            ON t1.k = t2.k
        WHERE (t1.k IN (1, 2)
            AND t2.x = 100)
            OR (t1.k IN (3, 4)
            AND t2.x = 200)
        ORDER BY t1.k ASC
    )
WHERE ilike(`explain`, '%Filter column: %')
SETTINGS enable_parallel_replicas = 0
FORMAT TSV;

SELECT
    t1.k,
    t1.a,
    t2.x
FROM
    tp1 AS t1
INNER JOIN tp2 AS t2
    ON t1.k = t2.k
WHERE (t1.k IN (1, 2)
    AND t2.x = 100)
    OR (t1.k IN (3, 4)
    AND t2.x = 200)
ORDER BY t1.k ASC;

SELECT REGEXP_REPLACE(trimLeft(`explain`), '__set_Int32_\\d+_\\d+', '__set_Int32_UNIQ_ID')
FROM (
        EXPLAIN actions = 1
        SELECT
            t1.k,
            t1.a,
            t2.x
        FROM
            tp1 AS t1
        INNER JOIN tp2 AS t2
            ON t1.k = t2.k
        WHERE (t2.x = 100)
            OR (t2.x = 200)
        ORDER BY t1.k ASC
    )
WHERE ilike(`explain`, '%Filter column: %')
SETTINGS enable_parallel_replicas = 0
FORMAT TSV;

SELECT
    t1.k,
    t1.a,
    t2.x
FROM
    tp1 AS t1
INNER JOIN tp2 AS t2
    ON t1.k = t2.k
WHERE (t2.x = 100)
    OR (t2.x = 200)
ORDER BY t1.k ASC;

SELECT REGEXP_REPLACE(trimLeft(`explain`), '__set_Int32_\\d+_\\d+', '__set_Int32_UNIQ_ID')
FROM (
        EXPLAIN actions = 1
        SELECT
            t1.k,
            t1.a,
            t2.x
        FROM
            tp1 AS t1
        INNER JOIN tp2 AS t2
            ON t1.k = t2.k
        WHERE (t1.k IN (1, 2))
            OR (t1.k IN (3, 4))
        ORDER BY t1.k ASC
    )
WHERE ilike(`explain`, '%Filter column: %')
SETTINGS enable_parallel_replicas = 0
FORMAT TSV;

SELECT
    t1.k,
    t1.a,
    t2.x
FROM
    tp1 AS t1
INNER JOIN tp2 AS t2
    ON t1.k = t2.k
WHERE (t1.k IN (1, 2))
    OR (t1.k IN (3, 4))
ORDER BY t1.k ASC;

SELECT REGEXP_REPLACE(trimLeft(`explain`), '__set_Int32_\\d+_\\d+', '__set_Int32_UNIQ_ID')
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            table1
        INNER JOIN table2
            ON b = d
        WHERE (a > 0)
            AND (c > 0)
            AND ((((a > 5)
            AND (c < 10))
            OR ((a > 6)
            AND (c < 11))))
        ORDER BY
            a ASC,
            c ASC
    )
WHERE ilike(`explain`, '%Filter column: %')
SETTINGS enable_parallel_replicas = 0
FORMAT TSV;

SELECT *
FROM
    table1
INNER JOIN table2
    ON (a = c)
WHERE (a > 0)
    AND (c > 0)
    AND ((((a > 5)
    AND (c < 10))
    OR ((a > 6)
    AND (c < 11))))
ORDER BY
    a ASC,
    c ASC
FORMAT TSV;

SELECT
    n1.number,
    n2.number
FROM
    numbers(6) AS n1
CROSS JOIN numbers(6) AS n2
WHERE ((n1.number = 1
    AND n2.number = 2)
    OR (n1.number = 3
    AND n2.number = 4)
    OR (n1.number = 5))
ORDER BY
    n1.number ASC,
    n2.number ASC
FORMAT TSV;

SELECT REGEXP_REPLACE(trimLeft(`explain`), '__set_Int32_\\d+_\\d+', '__set_Int32_UNIQ_ID')
FROM (
        SELECT `explain`
        FROM (
                EXPLAIN actions = 1
                SELECT
                    n1.number,
                    n2.number,
                    n3.number
                FROM
                    numbers(3) AS n2
                CROSS JOIN numbers(3) AS n3
                CROSS JOIN numbers(3) AS n1
                WHERE ((n1.number = 1)
                    AND ((n2.number + n3.number) = 3))
                    OR ((n1.number = 2)
                    AND ((n2.number + n3.number) = 2))
            )
    )
WHERE ilike(`explain`, '%Filter column: %')
SETTINGS enable_parallel_replicas = 0
FORMAT TSV;