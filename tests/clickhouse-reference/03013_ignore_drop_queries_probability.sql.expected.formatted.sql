-- Tags: memory-engine
CREATE TABLE test_memory
(
    number UInt64
)
ENGINE = Memory;

INSERT INTO test_memory SELECT 42;

SELECT *
FROM test_memory;

CREATE TABLE test_merge_tree
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

INSERT INTO test_merge_tree SELECT 42;

SELECT *
FROM test_merge_tree;

CREATE TABLE test_join
(
    number UInt64
)
ENGINE = Join(`ALL`, `LEFT`, number);

INSERT INTO test_join SELECT 42;

SELECT *
FROM test_join;