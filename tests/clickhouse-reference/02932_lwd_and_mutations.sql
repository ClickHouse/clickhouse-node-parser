SELECT count(), sum(v), arraySort(groupUniqArray(id % 10)) FROM t_lwd_mutations;
SELECT count(), sum(rows), sum(has_lightweight_delete) FROM system.parts WHERE database = currentDatabase() AND table = 't_lwd_mutations' AND active;
