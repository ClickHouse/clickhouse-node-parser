SELECT column, serialization_kind FROM system.parts_columns
WHERE table = 't_sparse' AND database = currentDatabase()
ORDER BY column, serialization_kind;
SELECT count() FROM t_sparse WHERE u > 0;
SELECT count() FROM t_sparse WHERE notEmpty(s);
