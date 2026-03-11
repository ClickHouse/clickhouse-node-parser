SELECT e FROM t_lightweight ORDER BY d;
SELECT name, rows FROM system.parts WHERE database = currentDatabase() AND table = 't_lightweight' ORDER BY name;
