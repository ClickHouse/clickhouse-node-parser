CREATE TABLE test_count
(
    pt Date
)
ENGINE = MergeTree
ORDER BY pt
PARTITION BY pt
SETTINGS index_granularity = 8192;

INSERT INTO test_count;

SELECT count(1)
FROM remote('127.0.0.{1,1,2}', currentDatabase(), test_count);