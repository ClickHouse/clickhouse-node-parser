SELECT count() FROM t_lwd_vertical;
SELECT count() FROM system.parts_columns WHERE database = currentDatabase() AND table = 't_lwd_vertical' AND active AND partition_id = 'all' AND column = '_row_exists';
SELECT
    merge_algorithm,
    read_rows,
    read_bytes,
    rows,
FROM system.part_log WHERE database = currentDatabase() AND table = 't_lwd_vertical' AND event_type = 'MergeParts'
ORDER BY event_time_microseconds;
