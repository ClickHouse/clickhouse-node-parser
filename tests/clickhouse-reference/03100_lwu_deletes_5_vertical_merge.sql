CREATE TABLE t_lwu_deletes_vertical
(
    id UInt64,
    c1 UInt64,
    c2 UInt64,
    c3 String,
    c4 String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS
    min_bytes_for_wide_part = 0,
    enable_block_number_column = 1,
    enable_block_offset_column = 1,
    vertical_merge_algorithm_min_rows_to_activate = 1,
    vertical_merge_algorithm_min_columns_to_activate = 1,
    vertical_merge_optimize_lightweight_delete = 1;
SET enable_lightweight_update = 1;
SET lightweight_delete_mode = 'lightweight_update_force';
SELECT count() FROM t_lwu_deletes_vertical;
SELECT count() FROM system.parts_columns WHERE database = currentDatabase() AND table = 't_lwu_deletes_vertical' AND active AND partition_id = 'all' AND column = '_row_exists';
SELECT
    merge_algorithm,
    read_rows,
    rows,
    ProfileEvents['ReadTasksWithAppliedPatches'],
    ProfileEvents['PatchesReadRows']
FROM system.part_log WHERE database = currentDatabase() AND table = 't_lwu_deletes_vertical' AND event_type = 'MergeParts'
ORDER BY event_time_microseconds;
