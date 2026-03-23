SYSTEM DROP  TABLE IF EXISTS numbers_1e6__fuzz_34;

SYSTEM DROP  TABLE IF EXISTS numbers_1e6__fuzz_33;

CREATE TABLE numbers_1e6__fuzz_34
(
    n UInt64
)
ENGINE = MergeTree
ORDER BY n AS
SELECT *
FROM numbers(10);

CREATE TABLE numbers_1e6__fuzz_33
(
    n UInt64
)
ENGINE = MergeTree
ORDER BY n AS
SELECT *
FROM numbers(10);

SET enable_analyzer = 1;

SET enable_parallel_replicas = 1, parallel_replicas_for_non_replicated_merge_tree = 1, cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost', max_parallel_replicas = 3, parallel_replicas_min_number_of_rows_per_replica = 0;

SYSTEM DROP  TABLE numbers_1e6__fuzz_34;

SYSTEM DROP  TABLE numbers_1e6__fuzz_33;