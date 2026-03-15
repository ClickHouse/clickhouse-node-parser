CREATE TABLE t_distinct_limit
(
    d Date,
    id Int64
)
ENGINE = MergeTree
ORDER BY d
PARTITION BY toYYYYMM(d)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SET max_threads = 10;

SET max_block_size = 1024;

SELECT id
FROM (
        SELECT DISTINCT id
        FROM remote('127.0.0.1,127.0.0.2', currentDatabase(), t_distinct_limit)
        LIMIT 10
    )
ORDER BY id ASC;