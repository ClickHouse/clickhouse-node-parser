-- Tags: no-asan, no-tsan, no-msan, no-ubsan, no-sanitize-coverage, no-parallel-replicas, no-flaky-check
-- - no-parallel-replicas - has --replace-log-memory-with-mergetree switch
SYSTEM drop  table if exists t_log;

SYSTEM drop  table if exists t_mt;

SYSTEM drop  table if exists mv;

SET max_threads = 1;

SET max_insert_threads = 1;

SET deduplicate_blocks_in_dependent_materialized_views = 0;

-- { echo }
-- Log does not support sparse columns - RemovingSparseTransform added
CREATE TABLE t_log
(
    key Int
)
ENGINE = Log;

-- MergeTree support sparse columns - no RemovingSparseTransform
CREATE TABLE t_mt
(
    key Int
)
ENGINE = MergeTree
ORDER BY tuple();

-- MergeTree pushes to Log, which does not support sparse columns - RemovingSparseTransform added
CREATE MATERIALIZED VIEW mv
TO t_log
AS
SELECT *
FROM t_mt;

SYSTEM drop  table mv;

-- Log does not support sparse columns - RemovingSparseTransform added
CREATE MATERIALIZED VIEW mv
TO t_mt
AS
SELECT *
FROM t_log;