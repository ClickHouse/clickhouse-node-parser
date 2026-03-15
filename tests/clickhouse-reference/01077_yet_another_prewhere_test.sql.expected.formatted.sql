CREATE TABLE t50
(
    a Int,
    b Int,
    s String
)
ENGINE = MergeTree
ORDER BY a
SETTINGS index_granularity = 50, index_granularity_bytes = 1000, min_index_granularity_bytes = 500;

SELECT
    a,
    b
FROM t50
PREWHERE b = 1
ORDER BY a ASC;