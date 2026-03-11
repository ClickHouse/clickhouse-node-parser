SELECT 1
FROM
    distributed_table1 AS t1
INNER JOIN distributed_table2 AS t2
    ON t1.a = t2.c
LIMIT 1;

SELECT 1
FROM
    distributed_table1 AS t1
INNER JOIN distributed_table2 AS t2
    ON t2.c = t1.a
LIMIT 1;

SELECT 1
FROM
    distributed_table1 AS t1
INNER JOIN distributed_table1 AS t2
    ON t1.a = t2.a
LIMIT 1;

SELECT
    t1.a AS t1_a,
    t2.a AS t2_a
FROM
    source_table1 AS t1
INNER JOIN source_table1 AS t2
    ON t1_a = t2_a
LIMIT 1;

SELECT
    t1.a AS t1_a,
    t2.a AS t2_a
FROM
    distributed_table1 AS t1
INNER JOIN distributed_table1 AS t2
    ON t1_a = t2_a
LIMIT 1;