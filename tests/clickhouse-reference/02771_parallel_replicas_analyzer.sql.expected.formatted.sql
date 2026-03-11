SELECT number
FROM join_inner_table__fuzz_146_replicated
SETTINGS
    enable_analyzer = 1,
    max_parallel_replicas = 2,
    cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost',
    enable_parallel_replicas = 1;

SELECT
    is_initial_query,
    ProfileEvents['ParallelReplicasQueryCount'] AS c,
    query
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND type = 'QueryFinish'
    AND query_id = (
        SELECT query_id
        FROM `system`.query_log
        WHERE current_database = currentDatabase()
            AND event_date >= yesterday()
            AND type = 'QueryFinish'
            AND like(query, '-- Simple query with analyzer and pure parallel replicas%')
    );