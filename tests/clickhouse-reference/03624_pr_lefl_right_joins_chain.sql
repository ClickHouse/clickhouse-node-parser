SELECT '-- no parallel replicas --';
SELECT *
FROM tab
ANY LEFT JOIN mem ON k1 = mem.k
ANY RIGHT JOIN mem2 ON k2 = mem2.k
ORDER BY tab.v
SETTINGS enable_parallel_replicas=0;
SELECT *
FROM tab
ANY LEFT JOIN mem ON k1 = mem.k
ANY RIGHT JOIN mem2 ON k2 = mem2.k
ORDER BY tab.v
SETTINGS enable_parallel_replicas=1, max_parallel_replicas=3, cluster_for_parallel_replicas='test_cluster_one_shard_three_replicas_localhost', parallel_replicas_for_non_replicated_merge_tree=1;
SELECT count()
FROM
(
    EXPLAIN
    SELECT *
    FROM tab
    ANY LEFT JOIN mem ON k1 = mem.k
    ANY RIGHT JOIN mem2 ON k2 = mem2.k
    ORDER BY tab.v ASC
    SETTINGS enable_parallel_replicas = 1, max_parallel_replicas = 3, cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost', parallel_replicas_for_non_replicated_merge_tree = 1
)
WHERE explain ILIKE '%ReadFromRemoteParallelReplicas%';
