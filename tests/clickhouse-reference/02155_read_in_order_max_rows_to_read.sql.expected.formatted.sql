SELECT a
FROM t_max_rows_to_read
WHERE a = 10
SETTINGS max_rows_to_read = 4;

SELECT a
FROM t_max_rows_to_read
ORDER BY a ASC
LIMIT 5
SETTINGS max_rows_to_read = 12;

SELECT a
FROM t_max_rows_to_read
WHERE a = 10
    OR a = 20
SETTINGS max_rows_to_read = 12;

SELECT a
FROM t_max_rows_to_read
ORDER BY a ASC
LIMIT 20
FORMAT Null
SETTINGS max_rows_to_read = 12;

SELECT a
FROM t_max_rows_to_read
WHERE a > 10
ORDER BY a ASC
LIMIT 5
FORMAT Null
SETTINGS max_rows_to_read = 12;

SELECT a
FROM t_max_rows_to_read
WHERE a = 10
    OR a = 20
FORMAT Null
SETTINGS max_rows_to_read = 4;