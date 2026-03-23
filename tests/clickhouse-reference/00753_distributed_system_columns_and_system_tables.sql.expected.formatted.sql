CREATE TABLE check_system_tables_null
(
    key Int
)
ENGINE = Null();

CREATE TABLE check_system_tables AS check_system_tables_null
ENGINE = Distributed(test_shard_localhost, currentDatabase(), check_system_tables_null);

SELECT
    total_bytes,
    total_rows
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'check_system_tables';

INSERT INTO check_system_tables SELECT *
FROM numbers(1)
SETTINGS prefer_localhost_replica = 0;

SELECT
    total_bytes > 0,
    total_rows
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'check_system_tables';