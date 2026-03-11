SELECT COUNT() FROM replicated_table_r1;
SELECT COUNT() FROM replicated_table_r2;
SELECT '-----Check that select and merge with lightweight delete.-----';
SELECT count(*) FROM t_light_r1;
SELECT * FROM t_light_r1 ORDER BY a;
SELECT * FROM t_light_r2 ORDER BY a;
SELECT * FROM t_light_sync_r2 ORDER BY a;
