SELECT count()
FROM tab
WHERE like(s, '%foo%');

SELECT count()
FROM tab
WHERE like(s, '%7777%');

SELECT
    ProfileEvents['TextIndexUseHint'] > 0,
    ProfileEvents['TextIndexDiscardHint'] > 0
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, 'SELECT count() FROM tab%')
ORDER BY event_time_microseconds ASC;