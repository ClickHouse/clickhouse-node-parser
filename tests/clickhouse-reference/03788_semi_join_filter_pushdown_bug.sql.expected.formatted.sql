CREATE TABLE t0
(
    c0 Int
)
ENGINE = Memory;

SET any_join_distinct_right_table_keys = 1, join_use_nulls = 1;

SELECT 1
FROM
    t0 AS t1
LEFT JOIN t0 AS t2
    ON t1.c0 = t2.c0
WHERE t1.c0 = t2.c0;

SELECT 1
FROM
    t0 AS t1
INNER JOIN t0 AS t2
    ON t1.c0 = t2.c0
WHERE t1.c0 = t2.c0;

SELECT 1
FROM
    t0 AS t1
RIGHT JOIN t0 AS t2
    ON t1.c0 = t2.c0
WHERE t1.c0 = t2.c0;