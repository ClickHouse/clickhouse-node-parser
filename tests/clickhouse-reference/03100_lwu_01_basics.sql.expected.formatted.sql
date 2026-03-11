SELECT *
FROM t_shared
ORDER BY id ASC;

SELECT
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_shared'
ORDER BY name ASC;

SELECT ProfileEvents['ReadTasksWithAppliedPatches']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query = 'SELECT * FROM t_shared ORDER BY id;'
    AND type = 'QueryFinish'
ORDER BY event_time_microseconds ASC;