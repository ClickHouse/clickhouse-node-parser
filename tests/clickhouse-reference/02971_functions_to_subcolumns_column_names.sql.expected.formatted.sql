SELECT
    length(arr),
    isNull(n)
FROM t_column_names
FORMAT JSONEachRow;