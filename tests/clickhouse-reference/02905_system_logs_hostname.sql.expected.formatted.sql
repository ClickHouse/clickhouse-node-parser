SELECT '02095_system_logs_hostname'
FROM `system`.one
FORMAT Null;

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