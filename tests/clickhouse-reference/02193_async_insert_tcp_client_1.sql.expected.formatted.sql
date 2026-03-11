SELECT *
FROM t_async_insert_02193_1
ORDER BY id ASC;

SELECT
    count(),
    sum(ProfileEvents['AsyncInsertQuery'])
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND ilike(query, 'INSERT INTO t_async_insert_02193_1%');