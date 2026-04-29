SELECT 1
SETTINGS
    log_queries = 1,
    log_queries_min_type = 'QUERY_FINISH'
FORMAT Null;

SYSTEM flush logs query_log;

SELECT client_name
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'select 1%')
FORMAT CSV;