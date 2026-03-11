SELECT * FROM t_lightweight ORDER BY id SETTINGS apply_patch_parts = 1;
SELECT name, rows FROM system.parts WHERE database = currentDatabase() AND table = 't_lightweight' AND active ORDER BY min_block_number;
SELECT count() FROM t_lightweight WHERE c1 != id;
