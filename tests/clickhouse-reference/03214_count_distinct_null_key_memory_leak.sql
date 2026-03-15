CREATE TABLE testnull
(
    `a` Nullable(String),
    `b` Nullable(String),
    `c` Nullable(String)
)
ENGINE = MergeTree
PARTITION BY tuple()
ORDER BY c
SETTINGS index_granularity = 8192, allow_nullable_key=1;
SELECT count(distinct b) FROM testnull GROUP BY a  SETTINGS max_memory_usage = 10000000; -- {serverError MEMORY_LIMIT_EXCEEDED}
