SELECT count()
FROM mytable_sparse;

SELECT DISTINCT
    table,
    column,
    serialization_kind,
    subcolumns.names,
    subcolumns.serializations
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table IN ('dst_sparse', 'mytable_sparse')
    AND active
    AND column = 'budget'
ORDER BY table ASC;