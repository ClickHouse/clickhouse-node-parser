CREATE TABLE t_lwd_index (id UInt64)
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_lwd_index/', '1')
ORDER BY id
SETTINGS index_granularity = 1, enable_block_number_column = 1, enable_block_offset_column = 1, add_minmax_index_for_numeric_columns=0;
SET enable_lightweight_update = 1;
SET lightweight_delete_mode = 'lightweight_update_force';
SELECT read_rows FROM system.query_log
WHERE type = 'QueryFinish' AND query like 'DELETE FROM t_lwd_index%' AND current_database = currentDatabase()
ORDER BY event_time_microseconds;
