SET merge_tree_read_split_ranges_into_intersecting_and_non_intersecting_injection_probability = 0.0;

CREATE TABLE t
(
    i int,
    j int,
    k int,
    PROJECTION p (    SELECT *
    ORDER BY j ASC)
)
ENGINE = MergeTree
ORDER BY i
SETTINGS index_granularity = 1;

SET optimize_use_projections = 1, max_rows_to_read = 3;

SET parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;

SELECT *
FROM t
WHERE i < 5
    AND j IN (1, 2);

CREATE TABLE test
(
    name String,
    time Int64
)
ENGINE = MergeTree
ORDER BY time;

SELECT count()
FROM (
        SELECT
            fromUnixTimestamp64Milli(time, 'UTC') AS time_fmt,
            name
        FROM test
        WHERE time_fmt > '2022-09-05 00:00:00'
    );