CREATE TABLE testnull
(
    a Nullable(String),
    b Nullable(String),
    c Nullable(String)
)
ENGINE = MergeTree
ORDER BY c
PARTITION BY tuple()
SETTINGS index_granularity = 8192, allow_nullable_key = 1;

SELECT countDistinct(b)
FROM testnull
GROUP BY a
SETTINGS max_memory_usage = 10000000; -- {serverError MEMORY_LIMIT_EXCEEDED}