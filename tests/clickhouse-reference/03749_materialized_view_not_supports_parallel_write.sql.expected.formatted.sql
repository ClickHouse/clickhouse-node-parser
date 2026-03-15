-- Tags: no-asan, no-tsan, no-msan, no-ubsan, no-sanitize-coverage, no-parallel-replicas, no-flaky-check
SET parallel_view_processing = 1, max_insert_threads = 2;

CREATE TABLE test_set
(
    c0 Int
)
ENGINE = Set;

CREATE TABLE test_table
(
    c0 Int
)
ENGINE = MergeTree
ORDER BY c0
PARTITION BY c0;

CREATE MATERIALIZED VIEW merge_tree_to_set
TO test_set
(
    c0 Int
)
AS
(SELECT *
FROM test_table);

-- Fuzzed
CREATE TABLE t0
(
    c0 Int
)
ENGINE = Log;

CREATE TABLE t1
(
    c0 Int
)
ENGINE = Memory;

CREATE MATERIALIZED VIEW v0
TO t0
(
    c0 Int
)
AS
(SELECT isNull(t1.*) AS c0
FROM t1);