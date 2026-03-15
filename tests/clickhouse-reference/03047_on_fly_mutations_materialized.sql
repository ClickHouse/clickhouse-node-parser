SET apply_mutations_on_fly = 1;
CREATE TABLE t_update_materialized (id UInt64, c1 UInt64, c2 UInt64 MATERIALIZED c1 * 2)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/t_update_materialized', '1') ORDER BY id;
SELECT id, c2 FROM t_update_materialized ORDER BY id;
SELECT id, c1, c2 FROM t_update_materialized ORDER BY id;
SELECT id, c2 FROM t_update_materialized;
SELECT id, c1, c2 FROM t_update_materialized;
SELECT count() FROM system.mutations
WHERE database = currentDatabase() AND table = 't_update_materialized' AND NOT is_done;
