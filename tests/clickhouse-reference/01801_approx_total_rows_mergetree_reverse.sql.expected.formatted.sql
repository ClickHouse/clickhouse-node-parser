SELECT *
FROM data_01801
WHERE key = 0
ORDER BY key ASC
SETTINGS max_rows_to_read = 9
FORMAT Null;

SELECT *
FROM data_01801
WHERE key = 0
ORDER BY key DESC
SETTINGS max_rows_to_read = 9
FORMAT Null;

SELECT *
FROM data_01801
WHERE key = 0
ORDER BY key ASC
SETTINGS max_rows_to_read = 10
FORMAT Null;

SELECT *
FROM data_01801
WHERE key = 0
ORDER BY key DESC
SETTINGS max_rows_to_read = 10
FORMAT Null;