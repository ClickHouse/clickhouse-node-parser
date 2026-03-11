SELECT
    type,
    serialization_kind
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_sparse_mutations_3'
    AND column = 's'
    AND active
ORDER BY name ASC;

SELECT
    type,
    serialization_kind,
    subcolumns.names,
    subcolumns.types,
    subcolumns.serializations
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_sparse_mutations_3'
    AND column = 's'
    AND active
ORDER BY name ASC;

SELECT
    sum(s.1),
    sum(s.2),
    groupUniqArray(s.3),
    groupUniqArray(s.4),
    groupUniqArray(s.5)
FROM t_sparse_mutations_3;

SELECT
    sum(s.1),
    sum(s.2),
    sum(s.3),
    sum(s.4),
    groupUniqArray(s.5)
FROM t_sparse_mutations_3;