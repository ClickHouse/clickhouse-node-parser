-- Tags: memory-engine
CREATE TABLE test_memory
(
    number UInt64
)
ENGINE = Memory;

SELECT *
FROM test_memory;

CREATE TABLE test_merge_tree
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

SELECT *
FROM test_merge_tree;

CREATE TABLE test_join
(
    number UInt64
)
ENGINE = Join(`ALL`, `LEFT`, number);

SELECT *
FROM test_join;