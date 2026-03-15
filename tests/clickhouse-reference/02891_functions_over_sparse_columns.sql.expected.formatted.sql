CREATE TABLE test
(
    key Int
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.1;

SELECT arrayMap(x -> (x <= key), [1])
FROM test;