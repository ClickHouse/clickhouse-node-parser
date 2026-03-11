SELECT *
FROM tab
ORDER BY x ASC
LIMIT 3
SETTINGS optimize_read_in_order = 1;

SELECT *
FROM tab
ORDER BY x ASC
LIMIT 4
SETTINGS optimize_read_in_order = 1;