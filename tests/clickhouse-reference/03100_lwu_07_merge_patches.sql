SET enable_lightweight_update = 1;
CREATE TABLE t_lightweight (id UInt64, c1 UInt64)
ENGINE = MergeTree ORDER BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;
SELECT * FROM t_lightweight ORDER BY id SETTINGS apply_patch_parts = 1;
SELECT name, rows FROM system.parts WHERE database = currentDatabase() AND table = 't_lightweight' AND active ORDER BY min_block_number;
SELECT count() FROM t_lightweight WHERE c1 != id;
