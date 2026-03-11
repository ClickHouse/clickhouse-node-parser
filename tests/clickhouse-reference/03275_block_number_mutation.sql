SELECT count(), sum(x) FROM t_block_number_delete;
SELECT command, is_done, latest_fail_reason FROM system.mutations WHERE database = currentDatabase() AND table = 't_block_number_delete';
SELECT column, count() FROM system.parts_columns WHERE database = currentDatabase() AND table = 't_block_number_delete' AND active GROUP BY column ORDER BY column;
