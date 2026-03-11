SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.key = t2.key
    OR t1.val = t2.key;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.key = t2.key;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.key = t2.key;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.key = t2.key
SETTINGS any_join_distinct_right_table_keys = 1;

SELECT *
FROM
    (
        SELECT
            key,
            sum(val) AS val
        FROM t1
        GROUP BY key
        WITH TOTALS
    ) AS t1
INNER JOIN (
        SELECT
            key,
            sum(val) AS val
        FROM t2
        GROUP BY key
        WITH TOTALS
    ) AS t2
    ON t1.key = t2.key;

SELECT *
FROM
    t1
INNER JOIN (
        SELECT
            key,
            sum(val) AS val
        FROM t2
        GROUP BY key
        WITH TOTALS
    ) AS t2
    ON t1.key = t2.key;

SELECT *
FROM
    (
        SELECT
            key,
            sum(val) AS val
        FROM t1
        GROUP BY key
        WITH TOTALS
    ) AS t1
INNER JOIN t2
    ON t1.key = t2.key;

SELECT *
FROM
    t1
FULL JOIN t2
    ON t1.key = t2.key
    AND t2.key > 0;

SELECT *
FROM
    t1
FULL JOIN t2
    ON t1.key = t2.key
    AND t1.key > 0;