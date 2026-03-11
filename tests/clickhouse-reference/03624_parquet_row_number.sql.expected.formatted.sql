SELECT
    _row_number,
    x
FROM file(concat(current_database(), '03624_parquet_row_number.parquet'))
WHERE x % 3 != 0
    AND x > 60
ORDER BY _row_number ASC;