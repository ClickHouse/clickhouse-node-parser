SELECT count() FROM t_01906 WHERE id >= 42;
SELECT count() FROM t_01906 FINAL WHERE id >= 42 and update_ts <= '2021-01-01 00:00:00';
