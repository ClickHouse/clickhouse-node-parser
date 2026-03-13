-- row 1 is damaged now: the column files of val columns & columns.txt is out of sync!
SELECT
    *,
    throwIf(val <> 'one')
FROM column_modify_test
WHERE id = 1
FORMAT CSV;