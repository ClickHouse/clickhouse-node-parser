SELECT name, toUInt32(metadata_modification_time) > 0, engine_full, create_table_query FROM system.tables WHERE database = currentDatabase() ORDER BY name FORMAT TSVRaw;
SELECT name FROM system.tables WHERE is_temporary = 1 AND name = 'test_temporary_table';
SELECT dependencies_database, dependencies_table FROM system.tables WHERE name = 'test_log' AND database=currentDatabase();
SELECT sum(ignore(*, metadata_modification_time, engine_full, create_table_query)) FROM system.tables WHERE database = '{CLICKHOUSE_DATABASE:String}';
