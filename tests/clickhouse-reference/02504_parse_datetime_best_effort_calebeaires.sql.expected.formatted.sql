SELECT
    toYear(col_date),
    col_date32,
    toYear(col_datetime),
    toYear(col_datetime32),
    col_datetime64
FROM my_table;