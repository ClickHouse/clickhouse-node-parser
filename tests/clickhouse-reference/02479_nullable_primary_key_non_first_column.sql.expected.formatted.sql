CREATE TABLE test_table
(
    A Nullable(String),
    B Nullable(String)
)
ENGINE = MergeTree
ORDER BY (A, B)
SETTINGS index_granularity = 1, allow_nullable_key = 1;

SELECT *
FROM test_table
WHERE isNull(B);

CREATE TABLE dm_metric_small2
(
    x Nullable(Int64),
    y Nullable(Int64),
    z Nullable(Int64)
)
ENGINE = MergeTree()
ORDER BY (x, y, z)
SETTINGS index_granularity = 1, allow_nullable_key = 1;

SELECT *
FROM dm_metric_small2
WHERE (x = 1)
    AND (y = 1)
    AND isNull(z);