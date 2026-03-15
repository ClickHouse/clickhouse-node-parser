CREATE TABLE test_local
(
    id UInt32,
    path LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY id;