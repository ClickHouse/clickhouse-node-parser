SELECT * FROM test_01343;
SELECT ProfileEvents['CreatedReadBufferMMap'] AS value FROM system.query_log WHERE current_database = currentDatabase() AND event_date >= yesterday() AND event_time >= now() - 300 AND query LIKE 'SELECT * FROM test_01343%' AND type = 2 ORDER BY event_time DESC LIMIT 1;
