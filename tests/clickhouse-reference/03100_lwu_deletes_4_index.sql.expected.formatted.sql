SELECT read_rows
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND like(query, 'DELETE FROM t_lwd_index%')
    AND current_database = currentDatabase()
ORDER BY event_time_microseconds ASC;