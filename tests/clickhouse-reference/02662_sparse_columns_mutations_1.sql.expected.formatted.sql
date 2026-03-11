SELECT
    name,
    type,
    serialization_kind
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_sparse_mutations_1'
    AND column = 's'
    AND active
ORDER BY name ASC;

SELECT
    countIf(s = 'foo'),
    arraySort(groupUniqArray(s))
FROM t_sparse_mutations_1;