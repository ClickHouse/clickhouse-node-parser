SELECT peak_threads_usage >= 10
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND startsWith(query, 'insert');