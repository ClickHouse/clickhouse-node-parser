SELECT * FROM t;
SELECT name, is_frozen FROM system.parts WHERE database = currentDatabase() AND table = 't';
SELECT '---';
