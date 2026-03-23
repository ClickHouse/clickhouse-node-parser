SET allow_reorder_prewhere_conditions = 0;

CREATE TABLE t1
(
    s1 String,
    s2 String,
    s3 String
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE t2
(
    fs1 FixedString(10),
    fs2 FixedString(10)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t1 SELECT
    repeat('t', 15) AS s1,
    'test' AS s2,
    'test' AS s3;

INSERT INTO t1 SELECT
    substring(s1, 1, 10),
    s2,
    s3
FROM generateRandom('s1 String, s2 String, s3 String')
LIMIT 10000;

INSERT INTO t2 SELECT *
FROM generateRandom()
LIMIT 10000;