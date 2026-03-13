SELECT *
FROM tab
WHERE u64_countmin > 3500
    AND u64_countmin < 3600
FORMAT NULL
SETTINGS use_statistics_cache = 0, log_comment = '03904_empty';

-- Expect that no statistics were loaded from disk
SELECT ProfileEvents['LoadedStatisticsMicroseconds']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = '03904_empty'
ORDER BY event_time_microseconds DESC
LIMIT 1;