SELECT sum(n)
FROM remote(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), tt)
SETTINGS log_comment = '03562_8a6a4b56-b9fa-4f60-b201-b637056a89c5';

SELECT sum(n)
FROM remote(test_cluster_two_shard_three_replicas_localhost, currentDatabase(), tt)
SETTINGS log_comment = '03562_152a0cc0-0811-46c9-839e-0f17426a1fc6';

SELECT countIf(ProfileEvents['ParallelReplicasQueryCount'] > 0)
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND event_date >= yesterday()
    AND initial_query_id IN (
        SELECT query_id
        FROM `system`.query_log
        WHERE current_database = currentDatabase()
            AND type = 'QueryFinish'
            AND event_date >= yesterday()
            AND log_comment = '03562_8a6a4b56-b9fa-4f60-b201-b637056a89c5'
    )
SETTINGS parallel_replicas_for_non_replicated_merge_tree = 0;

SELECT countIf(ProfileEvents['ParallelReplicasQueryCount'] > 0)
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND event_date >= yesterday()
    AND initial_query_id IN (
        SELECT query_id
        FROM `system`.query_log
        WHERE current_database = currentDatabase()
            AND type = 'QueryFinish'
            AND event_date >= yesterday()
            AND log_comment = '03562_152a0cc0-0811-46c9-839e-0f17426a1fc6'
    )
SETTINGS parallel_replicas_for_non_replicated_merge_tree = 0;