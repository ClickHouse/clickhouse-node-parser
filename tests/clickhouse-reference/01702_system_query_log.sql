-- Try to filter out all possible previous junk events by excluding old log entries,
SELECT query_kind, query FROM system.query_log
WHERE
    log_comment LIKE '%system.query_log%' AND type == 'QueryStart' AND event_date >= yesterday()
    AND current_database == currentDatabase() AND is_internal = 0
ORDER BY event_time_microseconds;
