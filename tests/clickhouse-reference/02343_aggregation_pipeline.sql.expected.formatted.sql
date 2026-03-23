-- Tags: no-object-storage
-- produces different pipeline if enabled
SET enable_memory_bound_merging_of_aggregation_results = 0;

SET merge_tree_read_split_ranges_into_intersecting_and_non_intersecting_injection_probability = 0.0;

SET max_threads = 16;

SET prefer_localhost_replica = 1;

SET optimize_aggregation_in_order = 0;

SET max_block_size = 65505;

SET allow_prefetched_read_pool_for_remote_filesystem = 0;

SET allow_prefetched_read_pool_for_local_filesystem = 0;

CREATE TABLE proj_agg_02343
(
    k1 UInt32,
    k2 UInt32,
    k3 UInt32,
    value UInt32,
    PROJECTION aaaa (    SELECT
        k1,
        k2,
        k3,
        sum(value)
    GROUP BY
        k1,
        k2,
        k3)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO proj_agg_02343 SELECT
    1,
    number % 2,
    number % 4,
    number
FROM numbers(100000);

-- { echoOff }
CREATE TABLE t
(
    a UInt64
)
ENGINE = MergeTree
ORDER BY (a);

CREATE TABLE dist_t AS t
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), t, a % 2);

INSERT INTO dist_t SELECT number
FROM numbers_mt(10);