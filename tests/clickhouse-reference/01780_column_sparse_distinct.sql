SELECT name, column, serialization_kind
FROM system.parts_columns
WHERE table = 't_sparse_distinct' AND database = currentDatabase() AND column = 'v'
ORDER BY name;
SELECT DISTINCT v FROM t_sparse_distinct ORDER BY v;
