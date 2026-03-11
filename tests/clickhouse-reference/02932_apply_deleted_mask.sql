SELECT count(), sum(v) FROM t_materialize_delete;
SELECT count(), sum(rows), sum(has_lightweight_delete) FROM system.parts WHERE database = currentDatabase() AND table = 't_materialize_delete' AND active;
