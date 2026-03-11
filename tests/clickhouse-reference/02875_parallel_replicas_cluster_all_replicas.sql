SELECT count() FROM clusterAllReplicas('test_cluster_two_shard_three_replicas_localhost', currentDatabase(), tt) settings log_comment='02875_190aed82-2423-413b-ad4c-24dcca50f65b';
SELECT countIf(ProfileEvents['ParallelReplicasQueryCount']>0) FROM system.query_log
WHERE type = 'QueryFinish' AND event_date >= yesterday()
AND initial_query_id IN (select query_id from system.query_log where current_database = currentDatabase() AND type = 'QueryFinish' AND event_date >= yesterday() AND log_comment = '02875_190aed82-2423-413b-ad4c-24dcca50f65b')
SETTINGS parallel_replicas_for_non_replicated_merge_tree=0;
