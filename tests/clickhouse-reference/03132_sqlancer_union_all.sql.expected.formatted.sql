SET enable_analyzer = 1;

CREATE TABLE t0
(
    c0 String
)
ENGINE = Memory();

CREATE TABLE IF NOT EXISTS t1
(
    c0 Int32,
    c1 Int32,
    c2 ALIAS c1
)
ENGINE = Log();

CREATE TABLE t2
(
    c0 Int32
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE t3
(
    c0 String
)
ENGINE = Memory();

CREATE TABLE t4
(
    c0 Int32
)
ENGINE = Memory();

SELECT t1.c1
FROM
    t3
CROSS JOIN t1
WHERE true
    AND t1.c2
UNION ALL
SELECT t1.c1
FROM
    t3
CROSS JOIN t1
WHERE NOT t1.c2
UNION ALL
SELECT t1.c1
FROM
    t3
CROSS JOIN t1
WHERE isNull(t1.c2);