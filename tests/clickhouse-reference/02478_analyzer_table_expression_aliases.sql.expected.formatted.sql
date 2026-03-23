SET enable_analyzer = 1;

DROP TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO test_table;

SELECT *
FROM test_table AS test_table;

SELECT '--';

SELECT *
FROM
    test_table AS t1
CROSS JOIN t1;

SELECT *
FROM
    t1
CROSS JOIN test_table AS t1;

SELECT *
FROM
    test_table AS test_table
CROSS JOIN test_table;

SELECT *
FROM
    (
        SELECT 1
    ) AS test_table
CROSS JOIN test_table AS subquery;

SELECT *
FROM
    test_table AS subquery
CROSS JOIN (
        SELECT 1
    ) AS test_table;

SELECT *
FROM
    t3
CROSS JOIN test_table AS t1
CROSS JOIN t1 AS t2
CROSS JOIN t2 AS t3;

SELECT *
FROM
    t3 AS t4
CROSS JOIN (
        SELECT 1
    ) AS t1
CROSS JOIN t1 AS t2
CROSS JOIN t2 AS t3;

DROP TABLE test_table;