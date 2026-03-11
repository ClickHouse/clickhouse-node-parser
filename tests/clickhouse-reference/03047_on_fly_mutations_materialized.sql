SELECT id, c2 FROM t_update_materialized ORDER BY id;
SELECT id, c1, c2 FROM t_update_materialized ORDER BY id;
SELECT id, c2 FROM t_update_materialized;
SELECT id, c1, c2 FROM t_update_materialized;
SELECT count() FROM system.mutations
WHERE database = currentDatabase() AND table = 't_update_materialized' AND NOT is_done;
