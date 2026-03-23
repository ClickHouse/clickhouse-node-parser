set allow_reorder_prewhere_conditions=0;
drop table if exists t1;
drop table if exists t2;
CREATE TABLE t1
(
    `s1` String,
    `s2` String,
    `s3` String
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE t2
(
    `fs1` FixedString(10),
    `fs2` FixedString(10)
)
ENGINE = MergeTree
ORDER BY tuple();
INSERT INTO t1 SELECT
    repeat('t', 15) s1,
    'test' s2,
    'test' s3;
INSERT INTO t1 SELECT
    substring(s1, 1, 10),
    s2,
    s3
FROM generateRandom('s1 String, s2 String, s3 String')
LIMIT 10000;
INSERT INTO t2 SELECT *
FROM generateRandom()
LIMIT 10000;
