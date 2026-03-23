CREATE OR REPLACE TABLE t1
(
    n UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY n;

INSERT INTO t1;

CREATE OR REPLACE TABLE t1
(
    n UInt64,
    s Nullable(String)
)
ENGINE = MergeTree
ORDER BY n;

INSERT INTO t1;

SELECT *
FROM t1;

INSERT INTO t1;