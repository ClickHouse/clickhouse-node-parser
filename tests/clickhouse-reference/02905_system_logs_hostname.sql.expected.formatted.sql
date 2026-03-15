SET log_query_threads = 1;

SET log_queries_min_type = 'QUERY_FINISH';

SET log_queries = 1;

SELECT '02095_system_logs_hostname'
FROM `system`.one
FORMAT Null;

SET log_queries = 0;

SET log_query_threads = 0;

SELECT hostname
FROM `system`.query_log
WHERE like(query, 'select ''02095_system_logs_hostname%')
    AND current_database = currentDatabase()
    AND event_date >= yesterday()
LIMIT 1
FORMAT Null;

SELECT
    hostName(),
    hostname
FROM `system`.query_thread_log
WHERE like(query, 'select ''02095_system_logs_hostname%')
    AND current_database = currentDatabase()
    AND event_date >= yesterday()
LIMIT 1
FORMAT Null;