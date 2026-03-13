SELECT s
FROM order_by_desc
ORDER BY u DESC
LIMIT 10
FORMAT Null
SETTINGS max_memory_usage = '400M';

SELECT s
FROM order_by_desc
ORDER BY u ASC
LIMIT 10
FORMAT Null
SETTINGS max_memory_usage = '400M';

--- 100 granules for reading from main table, 10 granules for lazy reading
SELECT read_rows <= (1024 * 110)
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND event_date >= yesterday()
    AND like(lower(query), lower('SELECT s FROM order_by_desc ORDER BY u%'));