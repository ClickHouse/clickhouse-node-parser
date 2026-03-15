CREATE OR REPLACE TABLE t1
(
    n UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY n;

CREATE OR REPLACE TABLE t1
(
    n UInt64,
    s Nullable(String)
)
ENGINE = MergeTree
ORDER BY n;

SELECT *
FROM t1;