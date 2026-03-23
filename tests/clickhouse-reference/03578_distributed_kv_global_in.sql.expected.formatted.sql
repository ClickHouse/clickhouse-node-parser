-- Tags: no-fasttest, use-rocksdb
SET prefer_localhost_replica = 0;

CREATE TABLE IF NOT EXISTS `03578_rocksdb_local`
(
    key UInt64,
    val String
)
ENGINE = EmbeddedRocksDB()
PRIMARY KEY key;

CREATE TABLE IF NOT EXISTS `03578_rocksdb_dist`
(
    key UInt64,
    val String
)
ENGINE = Distributed(test_cluster_two_shards_localhost, currentDatabase(), `03578_rocksdb_local`);

INSERT INTO `03578_rocksdb_local` SELECT
    number,
    concat('val-', number)
FROM numbers(1000);

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

CREATE TABLE IF NOT EXISTS `03578_keepermap_local`
(
    key UInt64,
    val String
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test_03578_global_in'))
PRIMARY KEY key;

CREATE TABLE IF NOT EXISTS `03578_keepermap_dist`
(
    key UInt64,
    val String
)
ENGINE = Distributed(test_cluster_two_shards_localhost, currentDatabase(), `03578_keepermap_local`);

INSERT INTO `03578_keepermap_local` SELECT
    number,
    concat('val-', number)
FROM numbers(1000);

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