SELECT count()
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'select ''01231_log_queries_min_type/QUERY_START%')
    AND event_date >= yesterday();

SELECT count()
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'select ''01231_log_queries_min_type/EXCEPTION_BEFORE_START%')
    AND event_date >= yesterday();

SELECT
    '01231_log_queries_min_type/EXCEPTION_WHILE_PROCESSING',
    max(number)
FROM `system`.numbers
LIMIT 1e6; -- { serverError TOO_MANY_ROWS }

SELECT count()
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'select ''01231_log_queries_min_type/EXCEPTION_WHILE_PROCESSING%')
    AND event_date >= yesterday()
    AND type = 'ExceptionWhileProcessing';

SELECT
    '01231_log_queries_min_type w/ Settings/EXCEPTION_WHILE_PROCESSING',
    max(number)
FROM `system`.numbers
LIMIT 1e6; -- { serverError TOO_MANY_ROWS }

SELECT count()
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'select ''01231_log_queries_min_type w/ Settings/EXCEPTION_WHILE_PROCESSING%')
    AND notLike(query, '%system.query_log%')
    AND event_date >= yesterday()
    AND type = 'ExceptionWhileProcessing'
    AND `Settings`['max_rows_to_read'] != '';