SELECT *
FROM test_01344
WHERE x = 'Hello, world';

SELECT ProfileEvents['CreatedReadBufferMMap'] AS value
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= yesterday()
    AND like(query, 'SELECT * FROM test_01344 WHERE x = ''Hello, world''%')
    AND type = 2
ORDER BY event_time DESC
LIMIT 1;