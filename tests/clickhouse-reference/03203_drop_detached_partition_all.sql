SELECT * FROM t_03203 ORDER BY p, v;
SELECT count() FROM system.detached_parts WHERE database = currentDatabase() AND table = 't_03203';
