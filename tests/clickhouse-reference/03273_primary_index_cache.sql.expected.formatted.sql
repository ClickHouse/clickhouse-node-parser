SELECT sum(primary_key_bytes_in_memory)
FROM `system`.parts
WHERE table = 't_primary_index_cache'
    AND active;

SELECT
    metric,
    value
FROM `system`.metrics
WHERE metric IN ('PrimaryIndexCacheFiles', 'PrimaryIndexCacheBytes')
ORDER BY metric ASC;

SELECT count()
FROM t_primary_index_cache
WHERE a > 100
    AND a < 200;

SELECT count()
FROM t_primary_index_cache
WHERE a > 100
    AND a < 200
    AND a % 2 = 0;

SELECT
    ProfileEvents['LoadedPrimaryIndexFiles'],
    ProfileEvents['LoadedPrimaryIndexRows'],
    ProfileEvents['LoadedPrimaryIndexBytes']
FROM `system`.query_log
WHERE like(query, 'SELECT count() FROM t_primary_index_cache%')
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
ORDER BY event_time_microseconds ASC;