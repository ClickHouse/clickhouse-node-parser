SELECT name, column, serialization_kind FROM system.parts_columns
WHERE database = currentDatabase() AND table = 't_sparse_02235'
ORDER BY name, column;
