SELECT *
FROM t_async_insert_alter
ORDER BY id ASC;

SELECT
    query,
    data_kind,
    status
FROM `system`.asynchronous_insert_log
WHERE database = currentDatabase()
    AND table = 't_async_insert_alter'
ORDER BY event_time_microseconds ASC;