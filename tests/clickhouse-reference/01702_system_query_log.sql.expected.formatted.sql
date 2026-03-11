SELECT
    query_kind,
    query
FROM `system`.query_log
WHERE like(log_comment, '%system.query_log%')
    AND type == 'QueryStart'
    AND event_date >= yesterday()
    AND current_database == currentDatabase()
    AND is_internal = 0
ORDER BY event_time_microseconds ASC;