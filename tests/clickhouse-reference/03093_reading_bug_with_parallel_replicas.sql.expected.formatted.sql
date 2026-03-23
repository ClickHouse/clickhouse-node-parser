SET max_threads = 16;

SET use_hedged_requests = 0;

SET max_parallel_replicas = 3;

SET cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost';

SET enable_parallel_replicas = 1;

SET parallel_replicas_for_non_replicated_merge_tree = 1;

SET allow_aggregate_partitions_independently = 1;

CREATE TABLE t2
(
    a Int16
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY a % 8
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

INSERT INTO t2 SELECT number
FROM numbers_mt(1e6);

SELECT a
FROM t2
GROUP BY a
FORMAT Null;