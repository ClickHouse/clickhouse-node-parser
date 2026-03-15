SET enable_analyzer = 1;

CREATE TABLE table1
(
    a UInt32
)
ENGINE = Memory;

CREATE TABLE table2
(
    a UInt32,
    b UInt32
)
ENGINE = Memory;

CREATE TABLE table3
(
    b UInt32,
    c UInt32
)
ENGINE = Memory;

CREATE TABLE table5
(
    a UInt32,
    b UInt32,
    c UInt32
)
ENGINE = Memory;

SELECT
    t1.a,
    t2.b,
    t3.c
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1.a = t2.a
INNER JOIN table3 AS t3
    ON t2.b = t3.b
ORDER BY t1.a ASC;

SELECT
    t1.a,
    t2.b,
    t5.c
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1.a = t2.a
INNER JOIN table5 AS t5
    ON t1.a = t5.a
    AND t2.b = t5.b
ORDER BY t1.a ASC;

SELECT
    t1.a,
    t2.a,
    t2.b,
    t3.b,
    t3.c,
    t5.a,
    t5.b,
    t5.c
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1.a = t2.a
INNER JOIN table3 AS t3
    ON t2.b = t3.b
INNER JOIN table5 AS t5
    ON t3.c = t5.c
ORDER BY t1.a ASC
FORMAT PrettyCompactNoEscapes;

SELECT
    t1.a AS t1_a,
    t2.a AS t2_a,
    t2.b AS t2_b,
    t3.b AS t3_b
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1_a = t2_a
INNER JOIN table3 AS t3
    ON t2_b = t3_b
ORDER BY t1.a ASC;

SELECT
    t1.a AS t1_a,
    t2.a AS t2_a,
    t2.b AS t2_b,
    t3.b AS t3_b
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1.a = t2.a
INNER JOIN table3 AS t3
    ON t2.b = t3.b
ORDER BY t1.a ASC;

SELECT
    t1.a AS t1_a,
    t2.a AS t2_a,
    t2.b AS t2_b,
    t3.b AS t3_b
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON table1.a = table2.a
INNER JOIN table3 AS t3
    ON table2.b = table3.b
ORDER BY t1.a ASC;

SELECT
    t1.a,
    t2.a,
    t2.b,
    t3.b
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON table1.a = table2.a
INNER JOIN table3 AS t3
    ON table2.b = table3.b
ORDER BY t1.a ASC;

SELECT
    t1.a,
    t2.a,
    t2.b,
    t3.b
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1.a = t2.a
INNER JOIN table3 AS t3
    ON t2.b = t3.b
ORDER BY t1.a ASC;

SELECT
    table1.a,
    table2.a,
    table2.b,
    table3.b
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON table1.a = table2.a
INNER JOIN table3 AS t3
    ON table2.b = table3.b
ORDER BY t1.a ASC;

SELECT
    t1.*,
    t2.*,
    t3.*
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON table1.a = table2.a
INNER JOIN table3 AS t3
    ON table2.b = table3.b
ORDER BY t1.a ASC
FORMAT PrettyCompactNoEscapes;

SELECT *
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1.a = t2.a
INNER JOIN table3 AS t3
    ON t2.b = t3.b
ORDER BY t1.a ASC
FORMAT PrettyCompactNoEscapes;

SELECT
    t1.a AS t1_a,
    t2.a AS t2_a,
    t2.b AS t2_b,
    t3.b AS t3_b,
    (t1.a + table2.b) AS t1_t2_x,
    (table1.a + table3.b) AS t1_t3_x,
    (t2.b + t3.b) AS t2_t3_x
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1_a = t2_a
INNER JOIN table3 AS t3
    ON t2_b = t3_b
ORDER BY t1.a ASC;

CREATE TABLE table_set
(
    x UInt32
)
ENGINE = Set;

SELECT count()
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1.a = t2.a
INNER JOIN table3 AS t3
    ON t2.b = t3.b
INNER JOIN table5 AS t5
    ON t3.c = t5.c
WHERE t1.a IN (table_set);