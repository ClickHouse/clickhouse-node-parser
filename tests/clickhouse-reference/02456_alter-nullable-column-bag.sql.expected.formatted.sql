SELECT
    *,
    throwIf(val <> 'one')
FROM column_modify_test
WHERE id = 1
FORMAT CSV;