SELECT
    *,
    throwIf(val <> 'one') AS issue
FROM column_modify_test
WHERE id = 1
FORMAT NULL;