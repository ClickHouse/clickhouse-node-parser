SELECT '-- RocksDB: set safe to cast';

SELECT *
FROM `03578_rocksdb`
WHERE key IN (0::UInt8, 1::UInt8)
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_rocksdb`
WHERE key IN (0::UInt32, 1::UInt32)
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_rocksdb`
WHERE key IN (0::UInt32, 1000000::UInt32)
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_rocksdb`
WHERE key IN ('0', 'non-number')
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_rocksdb`
WHERE key IN (
        SELECT 0::UInt8
        UNION ALL
        SELECT 1::UInt8
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_rocksdb`
WHERE key IN (
        SELECT 0::UInt32
        UNION ALL
        SELECT 1::UInt32
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_rocksdb`
WHERE key IN (
        SELECT 0::UInt32
        UNION ALL
        SELECT 1000000::UInt32
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_rocksdb`
WHERE key IN (
        SELECT '0'
        UNION ALL
        SELECT 'non-number'
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '%FROM 03578_rocksdb%')
    AND is_initial_query
ORDER BY event_time_microseconds ASC;

SELECT *
FROM `03578_rocksdb_nullable`
WHERE key IN (0, 1)
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_rocksdb_nullable`
WHERE key IN (NULL, 1)
ORDER BY
    1 ASC,
    2 ASC
SETTINGS transform_null_in = 1;

SELECT *
FROM `03578_rocksdb_nullable`
WHERE key IN (
        SELECT 0
        UNION ALL
        SELECT 1
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_rocksdb_nullable`
WHERE key IN (
        SELECT NULL
        UNION ALL
        SELECT 1
    )
ORDER BY
    1 ASC,
    2 ASC
SETTINGS transform_null_in = 1;

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '%FROM 03578_rocksdb_nullable%')
    AND is_initial_query
ORDER BY event_time_microseconds ASC;

SELECT *
FROM `03578_keepermap`
WHERE key IN (0::UInt8, 1::UInt8)
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_keepermap`
WHERE key IN (0::UInt32, 1::UInt32)
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_keepermap`
WHERE key IN (0::UInt32, 1000000::UInt32)
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_keepermap`
WHERE key IN ('0', 'non-number')
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_keepermap`
WHERE key IN (
        SELECT 0::UInt8
        UNION ALL
        SELECT 1::UInt8
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_keepermap`
WHERE key IN (
        SELECT 0::UInt32
        UNION ALL
        SELECT 1::UInt32
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_keepermap`
WHERE key IN (
        SELECT 0::UInt32
        UNION ALL
        SELECT 1000000::UInt32
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_keepermap`
WHERE key IN (
        SELECT '0'
        UNION ALL
        SELECT 'non-number'
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '%FROM 03578_keepermap%')
    AND is_initial_query
ORDER BY event_time_microseconds ASC;

SELECT *
FROM `03578_keepermap_nullable`
WHERE key IN (0, 1)
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_keepermap_nullable`
WHERE key IN (NULL, 1)
ORDER BY
    1 ASC,
    2 ASC
SETTINGS transform_null_in = 1;

SELECT *
FROM `03578_keepermap_nullable`
WHERE key IN (
        SELECT 0
        UNION ALL
        SELECT 1
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT *
FROM `03578_keepermap_nullable`
WHERE key IN (
        SELECT NULL
        UNION ALL
        SELECT 1
    )
ORDER BY
    1 ASC,
    2 ASC
SETTINGS transform_null_in = 1;

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '%FROM 03578_keepermap_nullable%')
    AND is_initial_query
ORDER BY event_time_microseconds ASC;