SELECT s1
FROM t_lightweight_mut_5
ORDER BY id ASC;

SELECT s2
FROM t_lightweight_mut_5
ORDER BY id ASC;

SELECT
    s1,
    s2
FROM t_lightweight_mut_5
ORDER BY id ASC;

SELECT
    query,
    ProfileEvents['FileOpen']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND ilike(query, 'SELECT%FROM t_lightweight_mut_5%')
    AND type = 'QueryFinish'
ORDER BY event_time_microseconds ASC;