SELECT *
FROM dist_02346
ORDER BY x ASC
SETTINGS additional_table_filters = map('dist_02346', 'x > 3 and x < 7');