SELECT d.String FROM test_dynamic SETTINGS enable_analyzer = 1;
SELECT d.String FROM test_dynamic SETTINGS enable_analyzer = 0;
SELECT
    ProfileEvents['FileOpen']
FROM system.query_log
WHERE (type = 2) AND (query LIKE 'SELECT d.String %test_dynamic%') AND (current_database = currentDatabase())
ORDER BY event_time_microseconds DESC
LIMIT 2;
