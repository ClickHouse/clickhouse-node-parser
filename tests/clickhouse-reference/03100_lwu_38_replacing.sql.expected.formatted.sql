CREATE TABLE t_lwu_replacing
(
    id UInt64,
    value String,
    timestamp DateTime
)
ENGINE = ReplacingMergeTree(timestamp)
ORDER BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

SET apply_patch_parts = 1;

SET enable_lightweight_update = 1;

SET lightweight_delete_mode = 'lightweight_update_force';

SELECT
    id,
    value
FROM t_lwu_replacing FINAL
ORDER BY id ASC;