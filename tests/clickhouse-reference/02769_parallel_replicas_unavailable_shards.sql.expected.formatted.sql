SELECT count()
FROM test_parallel_replicas_unavailable_shards
WHERE NOT ignore(*)
SETTINGS
    log_comment = '02769_7b513191-5082-4073-8568-53b86a49da79',
    parallel_replicas_local_plan = 0;

SELECT ProfileEvents['ParallelReplicasUnavailableCount']
FROM `system`.query_log
WHERE yesterday() <= event_date
    AND query_id IN (
        SELECT query_id
        FROM `system`.query_log
        WHERE log_comment = '02769_7b513191-5082-4073-8568-53b86a49da79'
            AND current_database = currentDatabase()
    )
    AND type = 'QueryFinish'
    AND query_id == initial_query_id;