SELECT count() >= 0 AS has_tasks FROM system.background_schedule_pool;
SELECT pool, database, table, table_uuid != toUUIDOrDefault(0) AS has_uuid, log_name FROM system.background_schedule_pool WHERE database = currentDatabase();
