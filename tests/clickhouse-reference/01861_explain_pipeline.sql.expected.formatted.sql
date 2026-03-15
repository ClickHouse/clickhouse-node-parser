CREATE TABLE test
(
    a Int,
    b Int
)
ENGINE = ReplacingMergeTree
ORDER BY a
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SET optimize_on_insert = 0;

SET max_threads = 1;

SELECT *
FROM test FINAL;

SET max_threads = 2;