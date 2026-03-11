SELECT
    *,
    _block_number
FROM table_with_some_columns
WHERE NOT ignore(*)
FORMAT Null;