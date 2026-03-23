-- add_minmax_index_for_numeric_columns=0: Adds more output to system.data_skipping_indices
SYSTEM drop  table if exists t_index;

CREATE TABLE t_index
(
    a int,
    b String
)
ENGINE = MergeTree()
ORDER BY a
SETTINGS add_minmax_index_for_numeric_columns = 0;

CREATE INDEX i_a ON t_index (a) TYPE minmax GRANULARITY 4;

CREATE INDEX i_a ON t_index (a) TYPE minmax GRANULARITY 2;

CREATE INDEX i_b ON t_index (b) TYPE bloom_filter GRANULARITY 2;

SELECT
    table,
    name,
    type,
    expr,
    granularity
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND table = 't_index';

SYSTEM drop  index i_a on t_index;

SYSTEM drop  index if exists i_a on t_index;

SYSTEM drop  table t_index;

CREATE TABLE t_index
(
    a int,
    b String
)
ENGINE = ReplicatedMergeTree('/test/2319/{database}', '1')
ORDER BY a
SETTINGS add_minmax_index_for_numeric_columns = 0;

CREATE TABLE t_index_replica
(
    a int,
    b String
)
ENGINE = ReplicatedMergeTree('/test/2319/{database}', '2')
ORDER BY a
SETTINGS add_minmax_index_for_numeric_columns = 0;

SELECT
    table,
    name,
    type,
    expr,
    granularity
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND table = 't_index_replica';