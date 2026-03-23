CREATE TABLE t
(
    i int,
    j int
)
ENGINE = MergeTree
ORDER BY i
SETTINGS add_minmax_index_for_numeric_columns = 0;

INSERT INTO t;

INSERT INTO t;

INSERT INTO t;

SET optimize_use_projections = 1, force_optimize_projection = 1;

SET parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;

SELECT i
FROM t
PREWHERE j = 4;

SELECT
    j = 2,
    i
FROM t
PREWHERE j = 2;

SELECT
    j = -1,
    j = NULL
FROM t
WHERE j = -1;