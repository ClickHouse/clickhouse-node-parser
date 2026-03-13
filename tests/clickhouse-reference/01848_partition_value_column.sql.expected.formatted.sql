SELECT count()
FROM tbl
WHERE _partition_value = ('2021-04-01', 1, 2)
SETTINGS max_rows_to_read = 1;

SELECT count()
FROM tbl
WHERE _partition_value.1 = '2021-04-01'
SETTINGS max_rows_to_read = 4;

SELECT count()
FROM tbl
WHERE _partition_value.2 = 0
SETTINGS max_rows_to_read = 4;

SELECT count()
FROM tbl
WHERE _partition_value.3 = 4
SETTINGS max_rows_to_read = 1;

SELECT _partition_value
FROM tbl2; -- { serverError UNKNOWN_IDENTIFIER }

SELECT _partition_value
FROM tbl2
GROUP BY 1; -- { serverError UNKNOWN_IDENTIFIER }