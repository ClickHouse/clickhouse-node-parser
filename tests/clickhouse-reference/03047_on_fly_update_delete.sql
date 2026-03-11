SELECT count(), sum(v) FROM t_lightweight_mut_6;
SELECT sum(has_lightweight_delete) FROM system.parts
WHERE database = currentDatabase() AND table = 't_lightweight_mut_6' AND active;
SELECT count(), sum(v) FROM t_lightweight_mut_6 SETTINGS apply_mutations_on_fly = 0;
SELECT count(), sum(v) FROM t_lightweight_mut_6 PREWHERE id % 5 = 0;
SELECT count(), sum(v) FROM t_lightweight_mut_6 PREWHERE id % 5 = 0 SETTINGS apply_mutations_on_fly = 0;
SELECT count() FROM system.mutations
WHERE database = currentDatabase() AND table = 't_lightweight_mut_6' AND NOT is_done;
