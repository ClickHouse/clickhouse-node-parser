CREATE TABLE IF NOT EXISTS normal
(
    key UInt32,
    value UInt32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;

INSERT INTO normal SELECT
    number AS key,
    number AS value
FROM numbers(10000);

INSERT INTO normal SELECT
    number AS key,
    number AS value
FROM numbers(10000, 100);

SET parallel_replicas_only_with_analyzer = 0;

SET optimize_use_projections = 1, optimize_aggregation_in_order = 0;

SET enable_parallel_replicas = 2, parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, max_parallel_replicas = 3, parallel_replicas_for_non_replicated_merge_tree = 1, cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost';

SELECT '---normal : contains both projections and parts ---';

SELECT trimLeft(replaceRegexpAll(`explain`, 'ReadFromRemoteParallelReplicas.*', 'ReadFromRemoteParallelReplicas'))
FROM (
        EXPLAIN
        SELECT sum(key)
        FROM normal
        WHERE key > 9999
            AND key < 10010
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%ReadFromRemoteParallelReplicas%')
SETTINGS enable_analyzer = 1;

SELECT sum(key)
FROM normal
WHERE key > 9999
    AND key < 10010;

INSERT INTO normal SELECT
    number AS key,
    number AS value
FROM numbers(10100);

CREATE TABLE agg
(
    key UInt32,
    value UInt32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;

INSERT INTO agg SELECT
    number AS key,
    number AS value
FROM numbers(100);

INSERT INTO agg SELECT
    number AS key,
    number AS value
FROM numbers(100, 100);

SELECT trimLeft(replaceRegexpAll(`explain`, 'ReadFromRemoteParallelReplicas.*', 'ReadFromRemoteParallelReplicas'))
FROM (
        EXPLAIN
        SELECT sum(value) AS v
        FROM agg
        WHERE key > 90
            AND key < 110
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%ReadFromRemoteParallelReplicas%')
SETTINGS enable_analyzer = 1;

SELECT sum(value) AS v
FROM agg
WHERE key > 90
    AND key < 110;

INSERT INTO agg SELECT
    number AS key,
    number AS value
FROM numbers(200);

CREATE TABLE x
(
    i int
)
ENGINE = MergeTree
ORDER BY i
SETTINGS index_granularity = 3;

INSERT INTO x SELECT *
FROM numbers(10);

SELECT trimLeft(replaceRegexpAll(`explain`, 'ReadFromRemoteParallelReplicas.*', 'ReadFromRemoteParallelReplicas'))
FROM (
        EXPLAIN
        SELECT max(i)
        FROM x
    )
WHERE like(`explain`, '%ReadFromPreparedSource%')
    OR like(`explain`, '%ReadFromRemoteParallelReplicas%')
SETTINGS enable_analyzer = 1;

SELECT max(i)
FROM x
SETTINGS
    enable_analyzer = 1,
    max_rows_to_read = 2,
    optimize_use_implicit_projections = 1,
    optimize_use_projection_filtering = 1;

SELECT trimLeft(replaceRegexpAll(`explain`, 'ReadFromRemoteParallelReplicas.*', 'ReadFromRemoteParallelReplicas'))
FROM (
        EXPLAIN
        SELECT count()
        FROM x
        WHERE (i >= 3
            AND i <= 6)
            OR i = 7
    )
WHERE like(`explain`, '%ReadFromPreparedSource%')
    OR like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%ReadFromRemoteParallelReplicas%')
SETTINGS enable_analyzer = 1;

SELECT count()
FROM x
WHERE (i >= 3
    AND i <= 6)
    OR i = 7;