SELECT name, rows  FROM system.parts WHERE database = currentDatabase() AND table = 't_shared' ORDER BY name;
SELECT * FROM t_shared ORDER BY id;
