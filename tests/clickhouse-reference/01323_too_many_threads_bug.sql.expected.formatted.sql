SELECT x
FROM table_01323_many_parts
LIMIT 10
FORMAT Null;

SELECT peak_threads_usage <= 4
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= today() - 1
    AND ilike(query, '%select x from table_01323_many_parts%')
    AND notLike(query, '%system.query_log%')
    AND type = 'QueryFinish'
ORDER BY query_start_time DESC
LIMIT 1;

SELECT x
FROM table_01323_many_parts
ORDER BY x ASC
LIMIT 10
FORMAT Null;

SELECT peak_threads_usage <= 36
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= today() - 1
    AND ilike(query, '%select x from table_01323_many_parts order by x%')
    AND notLike(query, '%system.query_log%')
    AND type = 'QueryFinish'
ORDER BY query_start_time DESC
LIMIT 1;