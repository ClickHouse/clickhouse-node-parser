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