select peak_threads_usage>=10 from system.query_log where
    event_date >= yesterday() and
    current_database = currentDatabase() and
    type = 'QueryFinish' and
    startsWith(query, 'insert');
