-- default coordinator
SELECT count(), sum(k)
FROM test
SETTINGS log_comment = '02950_parallel_replicas_used_replicas_count';
SELECT ProfileEvents['ParallelReplicasUsedCount'] > 0 FROM system.query_log WHERE type = 'QueryFinish' AND query_id IN (SELECT query_id FROM system.query_log WHERE current_database = currentDatabase() AND log_comment = '02950_parallel_replicas_used_replicas_count' AND type = 'QueryFinish' AND initial_query_id = query_id)  SETTINGS enable_parallel_replicas=0;
-- In order coordinator
SELECT k FROM test order by k limit 5 offset 89 SETTINGS optimize_read_in_order=1, log_comment='02950_parallel_replicas_used_replicas_count_2', merge_tree_min_rows_for_concurrent_read=1, max_threads=1;
SELECT ProfileEvents['ParallelReplicasUsedCount'] > 0 FROM system.query_log WHERE type = 'QueryFinish' AND query_id IN (SELECT query_id FROM system.query_log WHERE current_database = currentDatabase() AND log_comment = '02950_parallel_replicas_used_replicas_count_2' AND type = 'QueryFinish' AND initial_query_id = query_id)  SETTINGS enable_parallel_replicas=0;
-- In reverse order coordinator
SELECT k FROM test order by k desc limit 5 offset 9906 SETTINGS optimize_read_in_order=1, log_comment='02950_parallel_replicas_used_replicas_count_3', merge_tree_min_rows_for_concurrent_read=1, max_threads=1;
SELECT ProfileEvents['ParallelReplicasUsedCount'] > 0 FROM system.query_log WHERE type = 'QueryFinish' AND query_id IN (SELECT query_id FROM system.query_log WHERE current_database = currentDatabase() AND log_comment = '02950_parallel_replicas_used_replicas_count_3' AND type = 'QueryFinish' AND initial_query_id = query_id)  SETTINGS enable_parallel_replicas=0;
