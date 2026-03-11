SELECT max(i1)
FROM remote('localhost', currentDatabase(), test_view)
SETTINGS log_comment = 'THIS IS A COMMENT TO MARK THE INITIAL QUERY';

SELECT `columns`
FROM `system`.query_log
WHERE initial_query_id = (
        SELECT query_id
        FROM `system`.query_log
        WHERE current_database = currentDatabase()
            AND log_comment = 'THIS IS A COMMENT TO MARK THE INITIAL QUERY'
        LIMIT 1
    )
    AND type = 'QueryFinish'
    AND NOT is_initial_query;