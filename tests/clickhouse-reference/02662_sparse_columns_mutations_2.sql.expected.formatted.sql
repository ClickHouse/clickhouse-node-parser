SELECT
    type,
    serialization_kind
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_sparse_mutations_2'
    AND column = 's'
    AND active
ORDER BY name ASC;

SELECT
    count(),
    sum(s::UInt64)
FROM t_sparse_mutations_2
WHERE s != '';