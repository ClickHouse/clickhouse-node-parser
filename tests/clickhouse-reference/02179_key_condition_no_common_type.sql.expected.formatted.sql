SYSTEM drop  table if exists t;

CREATE TABLE t
(
    c Decimal32(9)
)
ENGINE = MergeTree
ORDER BY c;

INSERT INTO t;

SELECT *
FROM t
WHERE c < 1.2;

SYSTEM drop  table t;