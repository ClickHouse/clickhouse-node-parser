CREATE TABLE test
(
    `key` UInt64,
    `value` Int64
)
ENGINE = MergeTree
ORDER BY key;
INSERT INTO test SELECT cityHash64(number) AS key, number AS value FROM numbers(100);
SET enable_parallel_replicas = 0;
SET enable_analyzer = 1;
SET enable_join_runtime_filters = 0;
