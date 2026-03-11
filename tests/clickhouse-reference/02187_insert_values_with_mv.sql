SELECT 'VALUES', query_duration_ms >= 250
FROM system.query_log
WHERE
      current_database = currentDatabase()
  AND event_date >= yesterday()
  AND query LIKE '-- INSERT USING VALUES%'
  AND type = 'QueryFinish'
LIMIT 1;
SELECT 'TABLE', query_duration_ms >= 250
FROM system.query_log
WHERE
        current_database = currentDatabase()
  AND event_date >= yesterday()
  AND query LIKE '-- INSERT USING VALUES%'
  AND type = 'QueryFinish'
LIMIT 1;
