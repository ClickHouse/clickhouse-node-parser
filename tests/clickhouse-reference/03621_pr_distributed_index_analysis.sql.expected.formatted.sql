SELECT sum(key)
FROM test_10m
SETTINGS
    allow_experimental_parallel_reading_from_replicas = 0,
    distributed_index_analysis = 1,
    cluster_for_parallel_replicas = 'parallel_replicas';

SELECT sum(key)
FROM test_10m
SETTINGS
    allow_experimental_parallel_reading_from_replicas = 1,
    distributed_index_analysis = 1,
    cluster_for_parallel_replicas = 'parallel_replicas';

SELECT sum(key)
FROM test_10m
SETTINGS
    allow_experimental_parallel_reading_from_replicas = 1,
    distributed_index_analysis = 1,
    cluster_for_parallel_replicas = 'test_cluster_one_shard_two_replicas';

SELECT
    anyIf(normalizeQuery(query), is_initial_query) AS q,
    if(any(`Settings`['allow_experimental_parallel_reading_from_replicas']) = '1', if(any(`Settings`['cluster_for_parallel_replicas']) = 'parallel_replicas', max2(count(), 19)::UInt64, max2(count(), 3)::UInt64), if(any(`Settings`['cluster_for_parallel_replicas']) = 'parallel_replicas', max2(count(), 10)::UInt64, max2(count(), 2)::UInt64)) AS queries_with_subqueries,
    anyIf(ProfileEvents['DistributedIndexAnalysisScheduledReplicas'] > 0, is_initial_query) AS distributed_index_analysis_replicas,
    anyIf(ProfileEvents['ParallelReplicasUsedCount'] > 0, is_initial_query) AS read_with_parallel_replicas
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND type = 'QueryFinish'
    AND query_kind = 'Select'
    AND `Settings`['distributed_index_analysis'] = '1'
    AND endsWith(log_comment, concat('-', currentDatabase()))
GROUP BY initial_query_id
ORDER BY min(event_time_microseconds) ASC
FORMAT Vertical;