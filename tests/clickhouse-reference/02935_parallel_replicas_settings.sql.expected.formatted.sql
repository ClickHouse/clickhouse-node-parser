SELECT count()
FROM test_parallel_replicas_settings
WHERE NOT ignore(*);

SELECT count()
FROM test_parallel_replicas_settings
WHERE NOT ignore(*)
SETTINGS log_comment = '0_f621c4f2-4da7-4a7c-bb6d-052c442d0f7f';

SELECT count() > 0
FROM `system`.text_log
WHERE yesterday() <= event_date
    AND query_id IN (
        SELECT query_id
        FROM `system`.query_log
        WHERE current_database = currentDatabase()
            AND log_comment = '0_f621c4f2-4da7-4a7c-bb6d-052c442d0f7f'
    )
    AND level = 'Information'
    AND ilike(message, '%Disabling ''use_hedged_requests'' in favor of ''enable_parallel_replicas''%')
SETTINGS enable_parallel_replicas = 0;

SELECT count()
FROM test_parallel_replicas_settings
WHERE NOT ignore(*)
SETTINGS log_comment = '1_f621c4f2-4da7-4a7c-bb6d-052c442d0f7f';

SELECT count() > 0
FROM `system`.text_log
WHERE yesterday() <= event_date
    AND query_id IN (
        SELECT query_id
        FROM `system`.query_log
        WHERE current_database = currentDatabase()
            AND log_comment = '1_f621c4f2-4da7-4a7c-bb6d-052c442d0f7f'
    )
    AND level = 'Warning'
    AND ilike(message, '%Setting ''use_hedged_requests'' explicitly with enabled ''enable_parallel_replicas'' has no effect%')
SETTINGS enable_parallel_replicas = 0;