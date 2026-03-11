SELECT DISTINCT
    x,
    _row_number
FROM file(toNullable(concat(currentDatabase(), '/03727_prewhere_intermediate_columns.parquet')))
WHERE (x < 60)
    OR (x < 100)
ORDER BY
    (x < 60) ASC,
    x ASC
SETTINGS
    input_format_parquet_allow_missing_columns = 0,
    optimize_move_to_prewhere = 1;

SELECT x
FROM file(toNullable(concat(currentDatabase(), '/03727_prewhere_intermediate_columns.parquet')))
PREWHERE x
ORDER BY x ASC;