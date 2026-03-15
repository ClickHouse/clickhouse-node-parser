CREATE TABLE column_modify_test
(
    id UInt64,
    val String,
    other_col UInt64
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0;

-- till now everythings looks ok
SELECT *
FROM column_modify_test
ORDER BY
    id ASC,
    val ASC,
    other_col ASC;

-- row 1 is damaged now the column file & columns.txt is out of sync!
SELECT
    *,
    throwIf(val <> 'one') AS issue
FROM column_modify_test
WHERE id = 1;