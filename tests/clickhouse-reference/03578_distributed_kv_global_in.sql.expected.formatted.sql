SELECT '-- RocksDB: set';

SELECT *
FROM `03578_rocksdb_dist`
WHERE key GLOBAL IN (0, 1, 2)
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_rocksdb_dist`
WHERE key GLOBAL IN (
        SELECT number
        FROM numbers(3)
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '%FROM 03578_rocksdb_dist%')
    AND is_initial_query
ORDER BY event_time_microseconds ASC;

SELECT *
FROM `03578_keepermap_dist`
WHERE key GLOBAL IN (0, 1, 2)
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_keepermap_dist`
WHERE key GLOBAL IN (
        SELECT number
        FROM numbers(3)
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '%FROM 03578_keepermap_dist%')
    AND is_initial_query
ORDER BY event_time_microseconds ASC;