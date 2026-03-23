SYSTEM drop  table if exists t1;

SYSTEM drop  table if exists t2;

CREATE TABLE t1
(
    col UInt64,
    x UInt64 MATERIALIZED col + 1
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE t2
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t1;

INSERT INTO t2;

SELECT COUNT()
FROM
    t1
INNER JOIN t2
    USING (x);

SYSTEM drop  table t1;

SYSTEM drop  table t2;