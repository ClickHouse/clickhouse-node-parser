SELECT s1 FROM t_lightweight_mut_5 ORDER BY id;
SELECT s2 FROM t_lightweight_mut_5 ORDER BY id;
SELECT s1, s2 FROM t_lightweight_mut_5 ORDER BY id;
SELECT query, ProfileEvents['S3GetObject'] FROM system.query_log
WHERE
    current_database = currentDatabase()
    AND query ILIKE 'SELECT%FROM t_lightweight_mut_5%'
    AND type = 'QueryFinish'
ORDER BY event_time_microseconds;
