CREATE TABLE check_system_tables_null (key Int) Engine=Null();
CREATE TABLE check_system_tables AS check_system_tables_null Engine=Distributed(test_shard_localhost, currentDatabase(), check_system_tables_null);
SELECT total_bytes, total_rows FROM system.tables WHERE database = currentDatabase() AND name = 'check_system_tables';
SELECT total_bytes>0, total_rows FROM system.tables WHERE database = currentDatabase() AND name = 'check_system_tables';
