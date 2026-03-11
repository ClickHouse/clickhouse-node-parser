SELECT column, serialization_kind FROM system.parts_columns
WHERE table = 't_sparse' AND database = currentDatabase()
ORDER BY column;
SELECT * FROM t_sparse WHERE u != 0 ORDER BY id;
SELECT * FROM t_sparse WHERE s != '' ORDER BY id;
SELECT * FROM t_sparse WHERE arr1 != [] ORDER BY id;
SELECT * FROM t_sparse WHERE arr2 != [] ORDER BY id;
SELECT sum(u) FROM t_sparse;
SELECT id % 7, sum(u) FROM t_sparse GROUP BY id % 7 ORDER BY id % 7;
SELECT arrayFilter(x -> x % 2 = 1, arr2) FROM t_sparse WHERE arr2 != [] LIMIT 5;
SELECT * FROM t_sparse_1 ORDER BY v, id;
SELECT * FROM t_sparse_1 ORDER BY v DESC, id;
SELECT * FROM t_sparse_1 ORDER BY v, id LIMIT 5;
SELECT * FROM t_sparse_1 ORDER BY v DESC, id LIMIT 5;
