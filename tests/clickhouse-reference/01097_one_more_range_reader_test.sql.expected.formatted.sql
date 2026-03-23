SYSTEM drop  table if exists t;

CREATE TABLE t
(
    id UInt32,
    a Int
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t;

SELECT s
FROM t
PREWHERE a = 1;

SYSTEM drop  table t;

INSERT INTO t;