SET enable_multiple_prewhere_read_steps = 1;
SET enable_lightweight_update = 1;
SET move_all_conditions_to_prewhere = 1;
CREATE TABLE t_lwu_multistep(a UInt64, b UInt64, c UInt64, d UInt64, e UInt64)
ENGINE = MergeTree ORDER BY tuple()
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;
SELECT count() FROM t_lwu_multistep WHERE a = 1 AND b > 10000 AND c < 100000;
SELECT count() FROM t_lwu_multistep WHERE a = 0 AND b > 10000 AND c < 100000;
SELECT count() FROM t_lwu_multistep WHERE a = 1 AND b > 10000 AND c > 200000;
SELECT count() FROM t_lwu_multistep WHERE a = 0 AND b > 10000 AND c > 200000;
