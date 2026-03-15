CREATE TABLE normal
(
    `key` UInt32,
    `ts` DateTime,
    `value` UInt32,
    PROJECTION aaaa
    (
        SELECT
            ts,
            key,
            value
        ORDER BY ts, key
    )
)
ENGINE = MergeTree
ORDER BY tuple();
SET force_optimize_projection=1;
SET optimize_use_projections=1, optimize_aggregation_in_order=1, enable_parallel_replicas=0;
SET optimize_aggregation_in_order=0;
SET enable_parallel_replicas=1, parallel_replicas_local_plan=1, parallel_replicas_support_projection=1, parallel_replicas_for_non_replicated_merge_tree=1, max_parallel_replicas=3, cluster_for_parallel_replicas='test_cluster_one_shard_three_replicas_localhost';
CREATE TABLE agg
(
    `key` UInt32,
    `ts` DateTime,
    `value` UInt32,
    PROJECTION aaaa
    (
        SELECT
            ts,
            key,
            sum(value)
        GROUP BY ts, key
    )
)
ENGINE = MergeTree
ORDER BY tuple();
