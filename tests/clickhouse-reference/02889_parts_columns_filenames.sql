SELECT * FROM t_parts_columns_filenames ORDER BY id;
SELECT name, column, type, serialization_kind, substreams, filenames
FROM system.parts_columns
WHERE database = currentDatabase() AND table = 't_parts_columns_filenames'
ORDER BY name, column;
