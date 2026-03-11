SELECT type, serialization_kind FROM system.parts_columns
WHERE database = currentDatabase() AND table = 't_sparse_mutations_4' AND column = 'v' AND active
ORDER BY name;
