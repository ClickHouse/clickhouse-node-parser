SELECT type, serialization_kind, subcolumns.names, subcolumns.types, subcolumns.serializations FROM system.parts_columns
WHERE database = currentDatabase() AND table = 't_sparse_mutations_5' AND column = 't' AND active
ORDER BY name;
