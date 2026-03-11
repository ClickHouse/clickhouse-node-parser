SELECT disk_name, partition, rows FROM system.parts WHERE database = currentDatabase() AND table = 'test_move_partition_throttling' and active;
-- (8e6-1600000)/1600000=4.0
SELECT query_kind, query_duration_ms>4e3 FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND query_kind = 'Alter';
