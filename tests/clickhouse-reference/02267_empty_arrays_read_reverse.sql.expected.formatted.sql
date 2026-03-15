CREATE TABLE t_02267
(
    a Array(String),
    b UInt32,
    c Array(String)
)
ENGINE = MergeTree
ORDER BY b
SETTINGS index_granularity = 500, index_granularity_bytes = '10Mi';

SELECT *
FROM t_02267
WHERE hasAll(a, ['x'])
ORDER BY b DESC
SETTINGS
    max_threads = 1,
    max_block_size = 1000;