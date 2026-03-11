SELECT count() FROM tab WHERE s LIKE '%foo%';
SELECT count() FROM tab WHERE s LIKE '%7777%';
SELECT
    ProfileEvents['TextIndexUseHint'] > 0,
    ProfileEvents['TextIndexDiscardHint'] > 0
FROM system.query_log
WHERE current_database = currentDatabase() AND type = 'QueryFinish' AND query LIKE 'SELECT count() FROM tab%'
ORDER BY event_time_microseconds;
