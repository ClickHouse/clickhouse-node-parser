SELECT
    'Hello',
    throwIf(1);

SELECT length(stack_trace) > 1000
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, '%SELECT ''Hello'', throwIf(1)%')
    AND notLike(query, '%system%')
ORDER BY event_time_microseconds DESC
LIMIT 1;

SELECT like(message, '%Stack trace%')
FROM `system`.text_log
WHERE level = 'Error'
    AND like(message, '%Exception%throwIf%')
    AND query_id = (
        SELECT query_id
        FROM `system`.query_log
        WHERE current_database = currentDatabase()
            AND like(query, '%SELECT ''Hello'', throwIf(1)%')
            AND notLike(query, '%system%')
        ORDER BY event_time_microseconds DESC
        LIMIT 1
    )
ORDER BY event_time_microseconds DESC
LIMIT 10;

SELECT
    'World',
    throwIf(1);

SELECT length(stack_trace)
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, '%SELECT ''World'', throwIf(1)%')
    AND notLike(query, '%system%')
ORDER BY event_time_microseconds DESC
LIMIT 1;

SELECT like(message, '%Stack trace%')
FROM `system`.text_log
WHERE level = 'Error'
    AND like(message, '%Exception%throwIf%')
    AND query_id = (
        SELECT query_id
        FROM `system`.query_log
        WHERE current_database = currentDatabase()
            AND like(query, '%SELECT ''World'', throwIf(1)%')
            AND notLike(query, '%system%')
        ORDER BY event_time_microseconds DESC
        LIMIT 1
    )
ORDER BY event_time_microseconds DESC
LIMIT 10;