SELECT name, column, type FROM system.parts_columns
WHERE table = 't_materialize_column' AND database = currentDatabase() AND active
ORDER BY name, column;
SELECT * FROM t_materialize_column ORDER BY i;
