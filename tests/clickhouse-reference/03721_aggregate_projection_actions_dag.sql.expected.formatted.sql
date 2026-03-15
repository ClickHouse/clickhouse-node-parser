CREATE TABLE test
(
    key UInt64,
    value Int64
)
ENGINE = MergeTree
ORDER BY key;

SET enable_parallel_replicas = 0;

SET enable_analyzer = 1;

SET enable_join_runtime_filters = 0;