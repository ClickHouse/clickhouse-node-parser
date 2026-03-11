SELECT count() FROM t_min_bytes_to_seek WHERE id IN (10, 1000, 5000, 9000) SETTINGS merge_tree_min_bytes_for_seek = 0;
SELECT count() FROM t_min_bytes_to_seek WHERE id IN (10, 1000, 5000, 9000) SETTINGS merge_tree_min_bytes_for_seek = 1000000000;
SELECT count() FROM t_min_bytes_to_seek WHERE id IN (10, 1000, 5000, 9000) SETTINGS merge_tree_min_rows_for_seek = 0;
SELECT count() FROM t_min_bytes_to_seek WHERE id IN (10, 1000, 5000, 9000) SETTINGS merge_tree_min_rows_for_seek = 1000000000;
SELECT ProfileEvents['SelectedRanges']
FROM system.query_log
WHERE current_database = currentDatabase() AND query LIKE 'SELECT count() FROM t_min_bytes_to_seek%' AND type = 'QueryFinish'
ORDER BY event_time_microseconds;
