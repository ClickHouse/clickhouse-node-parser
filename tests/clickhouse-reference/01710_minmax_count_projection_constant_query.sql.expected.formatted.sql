SYSTEM drop  table if exists t;

CREATE TABLE t
(
    n int
)
ENGINE = MergeTree
ORDER BY n;

INSERT INTO t;

SELECT 1
FROM t
GROUP BY 1;

SYSTEM drop  table t;