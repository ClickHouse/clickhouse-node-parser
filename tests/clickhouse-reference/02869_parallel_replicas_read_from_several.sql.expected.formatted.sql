CREATE TABLE t1
(
    k UInt32,
    v UInt32
)
ENGINE = ReplicatedMergeTree('/parallel_replicas/{database}/test_tbl', 'r1')
ORDER BY k
SETTINGS index_granularity = 10;

CREATE TABLE t2
(
    k UInt32,
    v UInt32
)
ENGINE = ReplicatedMergeTree('/parallel_replicas/{database}/test_tbl', 'r2')
ORDER BY k
SETTINGS index_granularity = 10;

CREATE TABLE t3
(
    k UInt32,
    v UInt32
)
ENGINE = ReplicatedMergeTree('/parallel_replicas/{database}/test_tbl', 'r3')
ORDER BY k
SETTINGS index_granularity = 10;

SELECT
    count(),
    min(k),
    max(k),
    avg(k)
FROM t1
SETTINGS
    enable_parallel_replicas = 1,
    max_parallel_replicas = 3,
    cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost';