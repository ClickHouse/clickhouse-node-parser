-- The values for Date32 and DateTime64 will be year 1969, while the values of Date, DateTime will contain a value affected by implementation-defined overflow and can be arbitrary.
SELECT
    toYear(col_date),
    col_date32,
    toYear(col_datetime),
    toYear(col_datetime32),
    col_datetime64
FROM my_table;