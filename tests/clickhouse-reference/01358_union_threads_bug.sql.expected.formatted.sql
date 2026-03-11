SELECT count()
FROM (
        SELECT number
        FROM numbers_mt(1000000)
        ORDER BY number DESC
        LIMIT 100
        UNION ALL
        SELECT number
        FROM numbers_mt(1000000)
        ORDER BY number DESC
        LIMIT 100
        UNION ALL
        SELECT number
        FROM numbers_mt(1000000)
        ORDER BY number DESC
        LIMIT 100
    );

SELECT length(thread_ids) >= 1
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= today() - 1
    AND like(query, '%SELECT count() FROM (SELECT number FROM numbers_mt(1000000) ORDER BY number DESC LIMIT 100 UNION ALL SELECT number FROM numbers_mt(1000000) ORDER BY number DESC LIMIT 100 UNION ALL SELECT number FROM numbers_mt(1000000) ORDER BY number DESC LIMIT 100)%')
    AND type = 'QueryFinish'
ORDER BY query_start_time DESC
LIMIT 1;