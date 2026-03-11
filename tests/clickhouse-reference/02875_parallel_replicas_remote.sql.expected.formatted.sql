SELECT count()
FROM remote('127.0.0.{1..6}', currentDatabase(), tt)
SETTINGS log_comment = '02875_89f3c39b-1919-48cb-b66e-ef9904e73146';

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
            AND log_comment = '02875_89f3c39b-1919-48cb-b66e-ef9904e73146'
    )
SETTINGS parallel_replicas_for_non_replicated_merge_tree = 0;