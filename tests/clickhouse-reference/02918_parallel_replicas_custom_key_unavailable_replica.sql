
SELECT y, count()
FROM cluster(test_cluster_1_shard_3_replicas_1_unavailable, currentDatabase(), 02918_parallel_replicas)
GROUP BY y
ORDER BY y
SETTINGS max_parallel_replicas=3, enable_parallel_replicas=1, parallel_replicas_custom_key='cityHash64(y)', parallel_replicas_mode='custom_key_sampling';
SELECT y, count()
FROM cluster(test_cluster_1_shard_3_replicas_1_unavailable, currentDatabase(), 02918_parallel_replicas)
GROUP BY y
ORDER BY y
SETTINGS max_parallel_replicas=3, enable_parallel_replicas=1, parallel_replicas_custom_key='cityHash64(y)', parallel_replicas_mode='custom_key_range';
