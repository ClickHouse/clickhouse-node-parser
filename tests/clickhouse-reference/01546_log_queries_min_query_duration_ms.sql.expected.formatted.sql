SELECT '01546_log_queries_min_query_duration_ms-fast'
FORMAT Null;

SELECT count()
FROM `system`.query_log
WHERE like(query, 'select ''01546_log_queries_min_query_duration_ms-fast%')
    AND current_database = currentDatabase()
    AND event_date >= yesterday();

SELECT count()
FROM `system`.query_thread_log
WHERE like(query, 'select ''01546_log_queries_min_query_duration_ms-fast%')
    AND current_database = currentDatabase()
    AND event_date >= yesterday();

SELECT
    '01546_log_queries_min_query_duration_ms-slow',
    sleep(0.4)
FORMAT Null;

SELECT count()
FROM `system`.query_log
WHERE like(query, 'select ''01546_log_queries_min_query_duration_ms-slow%')
    AND current_database = currentDatabase()
    AND event_date >= yesterday();

SELECT if(count() == 2, 'OK', concat('Fail: ', toString(count())))
FROM `system`.query_thread_log
WHERE like(query, 'select ''01546_log_queries_min_query_duration_ms-slow%')
    AND current_database = currentDatabase()
    AND event_date >= yesterday();