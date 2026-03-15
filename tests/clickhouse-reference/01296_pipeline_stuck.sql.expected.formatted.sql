CREATE TABLE data_01295
(
    key Int
)
ENGINE = AggregatingMergeTree()
ORDER BY key;

SELECT *
FROM data_01295;

SET max_insert_threads = 2;