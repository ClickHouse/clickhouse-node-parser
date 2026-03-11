SELECT
    v,
    blob
FROM clusterAllReplicas(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), tt)
ORDER BY k ASC
LIMIT 3;