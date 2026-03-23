-- Tags: memory-engine
CREATE TABLE test_memory
(
    number UInt64
)
ENGINE = Memory;

INSERT INTO test_memory SELECT 42;

SYSTEM drop  table test_memory settings ignore_drop_queries_probability=1;

SELECT *
FROM test_memory;

SYSTEM drop  table test_memory;

CREATE TABLE test_merge_tree
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

INSERT INTO test_merge_tree SELECT 42;

SYSTEM drop  table test_merge_tree settings ignore_drop_queries_probability=1;

SELECT *
FROM test_merge_tree;

SYSTEM drop  table test_merge_tree;

CREATE TABLE test_join
(
    number UInt64
)
ENGINE = Join(`ALL`, `LEFT`, number);

INSERT INTO test_join SELECT 42;

SYSTEM drop  table test_join settings ignore_drop_queries_probability=1;

SELECT *
FROM test_join;

SYSTEM drop  table test_join;