SELECT *
FROM column_modify_test
ORDER BY
    id ASC,
    val ASC,
    other_col ASC;

SELECT
    *,
    throwIf(val <> 'one') AS issue
FROM column_modify_test
WHERE id = 1;