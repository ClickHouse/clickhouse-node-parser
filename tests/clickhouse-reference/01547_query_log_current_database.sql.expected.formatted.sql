SELECT '01547_query_log_current_database'
FROM `system`.one
FORMAT Null;

SELECT count()
FROM `system`.query_log
WHERE like(query, 'select ''01547_query_log_current_database%')
    AND current_database = currentDatabase()
    AND event_date >= yesterday();

SELECT count() == 2
FROM `system`.query_thread_log
WHERE like(query, 'select ''01547\\_query\\_log\\_current\\_database%')
    AND current_database = currentDatabase()
    AND event_date >= yesterday();