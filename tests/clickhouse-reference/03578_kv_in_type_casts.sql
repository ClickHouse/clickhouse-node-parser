-- Tags: no-fasttest, use-rocksdb

DROP TABLE IF EXISTS 03578_rocksdb;
CREATE TABLE IF NOT EXISTS 03578_rocksdb
(
    key UInt16,
    val String
)
ENGINE = EmbeddedRocksDB()
PRIMARY KEY key;
INSERT INTO 03578_rocksdb SELECT number, 'val-' || number FROM numbers(100);
SELECT '-- RocksDB: set safe to cast';
SELECT * FROM 03578_rocksdb WHERE key IN (0::UInt8, 1::UInt8) ORDER BY 1, 2;
SELECT * FROM 03578_rocksdb WHERE key IN (0::UInt32, 1::UInt32) ORDER BY 1, 2;
SELECT * FROM 03578_rocksdb WHERE key IN (0::UInt32, 1000000::UInt32) ORDER BY 1, 2;
SELECT * FROM 03578_rocksdb WHERE key IN ('0', 'non-number') ORDER BY 1, 2; -- { serverError TYPE_MISMATCH }
SELECT * FROM 03578_rocksdb WHERE key IN (SELECT 0::UInt8 UNION ALL SELECT 1::UInt8) ORDER BY 1, 2;
SELECT * FROM 03578_rocksdb WHERE key IN (SELECT 0::UInt32 UNION ALL SELECT 1::UInt32) ORDER BY 1, 2;
SELECT * FROM 03578_rocksdb WHERE key IN (SELECT 0::UInt32 UNION ALL SELECT 1000000::UInt32) ORDER BY 1, 2;
SELECT * FROM 03578_rocksdb WHERE key IN (SELECT '0' UNION ALL SELECT 'non-number') ORDER BY 1, 2;
SYSTEM FLUSH LOGS query_log;
SELECT read_rows
FROM system.query_log
WHERE current_database = currentDatabase()
  AND type = 'QueryFinish'
  AND query LIKE '%FROM 03578_rocksdb%'
  AND is_initial_query
ORDER BY event_time_microseconds;
DROP TABLE 03578_rocksdb;
DROP TABLE IF EXISTS 03578_rocksdb_nullable;
CREATE TABLE IF NOT EXISTS 03578_rocksdb_nullable
(
    key Nullable(UInt16),
    val String
)
ENGINE = EmbeddedRocksDB()
PRIMARY KEY key;
INSERT INTO 03578_rocksdb_nullable SELECT null, 'val-null';
INSERT INTO 03578_rocksdb_nullable SELECT number, 'val-' || number FROM numbers(99);
SELECT * FROM 03578_rocksdb_nullable WHERE key IN (0, 1) ORDER BY 1, 2;
SELECT * FROM 03578_rocksdb_nullable WHERE key IN (null, 1) ORDER BY 1, 2 SETTINGS transform_null_in = 1;
SELECT * FROM 03578_rocksdb_nullable WHERE key IN (SELECT 0 UNION ALL SELECT 1) ORDER BY 1, 2;
SELECT * FROM 03578_rocksdb_nullable WHERE key IN (SELECT null UNION ALL SELECT 1) ORDER BY 1, 2 SETTINGS transform_null_in = 1;
SELECT read_rows
FROM system.query_log
WHERE current_database = currentDatabase()
  AND type = 'QueryFinish'
  AND query LIKE '%FROM 03578_rocksdb_nullable%'
  AND is_initial_query
ORDER BY event_time_microseconds;
DROP TABLE 03578_rocksdb_nullable;
DROP TABLE IF EXISTS 03578_keepermap;
CREATE TABLE IF NOT EXISTS 03578_keepermap
(
    key UInt16,
    val String
)
ENGINE = KeeperMap('/' || currentDatabase() || '/test_03578_type_cast')
PRIMARY KEY key;
INSERT INTO 03578_keepermap SELECT number, 'val-' || number FROM numbers(100);
SELECT * FROM 03578_keepermap WHERE key IN (0::UInt8, 1::UInt8) ORDER BY 1, 2;
SELECT * FROM 03578_keepermap WHERE key IN (0::UInt32, 1::UInt32) ORDER BY 1, 2;
SELECT * FROM 03578_keepermap WHERE key IN (0::UInt32, 1000000::UInt32) ORDER BY 1, 2;
SELECT * FROM 03578_keepermap WHERE key IN ('0', 'non-number') ORDER BY 1, 2; -- { serverError TYPE_MISMATCH }
SELECT * FROM 03578_keepermap WHERE key IN (SELECT 0::UInt8 UNION ALL SELECT 1::UInt8) ORDER BY 1, 2;
SELECT * FROM 03578_keepermap WHERE key IN (SELECT 0::UInt32 UNION ALL SELECT 1::UInt32) ORDER BY 1, 2;
SELECT * FROM 03578_keepermap WHERE key IN (SELECT 0::UInt32 UNION ALL SELECT 1000000::UInt32) ORDER BY 1, 2;
SELECT * FROM 03578_keepermap WHERE key IN (SELECT '0' UNION ALL SELECT 'non-number') ORDER BY 1, 2;
SELECT read_rows
FROM system.query_log
WHERE current_database = currentDatabase()
  AND type = 'QueryFinish'
  AND query LIKE '%FROM 03578_keepermap%'
  AND is_initial_query
ORDER BY event_time_microseconds;
DROP TABLE 03578_keepermap;
DROP TABLE IF EXISTS 03578_keepermap_nullable;
CREATE TABLE IF NOT EXISTS 03578_keepermap_nullable
(
    key Nullable(UInt16),
    val String
)
ENGINE = KeeperMap('/' || currentDatabase() || '/test_03578_type_cast_null')
PRIMARY KEY key;
INSERT INTO 03578_keepermap_nullable SELECT null, 'val-null';
INSERT INTO 03578_keepermap_nullable SELECT number, 'val-' || number FROM numbers(99);
SELECT * FROM 03578_keepermap_nullable WHERE key IN (0, 1) ORDER BY 1, 2;
SELECT * FROM 03578_keepermap_nullable WHERE key IN (null, 1) ORDER BY 1, 2 SETTINGS transform_null_in = 1;
SELECT * FROM 03578_keepermap_nullable WHERE key IN (SELECT 0 UNION ALL SELECT 1) ORDER BY 1, 2;
SELECT * FROM 03578_keepermap_nullable WHERE key IN (SELECT null UNION ALL SELECT 1) ORDER BY 1, 2 SETTINGS transform_null_in = 1;
SELECT read_rows
FROM system.query_log
WHERE current_database = currentDatabase()
  AND type = 'QueryFinish'
  AND query LIKE '%FROM 03578_keepermap_nullable%'
  AND is_initial_query
ORDER BY event_time_microseconds;
DROP TABLE 03578_keepermap_nullable;
