SELECT 0 as _row_exists
FROM dummy_table_03215
WHERE (date_col, id_col) IN (SELECT (date_col, id_col) FROM dummy_table_03215);
