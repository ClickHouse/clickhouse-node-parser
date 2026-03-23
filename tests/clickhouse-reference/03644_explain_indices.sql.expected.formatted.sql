-- Tags: no-replicated-database, no-parallel-replicas
-- no-replicated-database: EXPLAIN output differs for replicated database.
-- no-parallel-replicas: EXPLAIN output differs for parallel replicas.
-- add_minmax_index_for_numeric_columns=0: Different plan
SYSTEM DROP  TABLE IF EXISTS test_indexed;

CREATE TABLE test_indexed
(
    id UInt32,
    value String
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS add_minmax_index_for_numeric_columns = 0, index_granularity = 8192;

INSERT INTO test_indexed;

SYSTEM DROP  TABLE test_indexed;