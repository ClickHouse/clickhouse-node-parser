SELECT i
FROM a
WHERE _part_offset >= 5
ORDER BY i ASC
SETTINGS max_bytes_to_read = 1;

SELECT i
FROM a
WHERE _part_offset = 0
ORDER BY i ASC
SETTINGS max_rows_to_read = 2;

SELECT i
FROM a
WHERE _part_offset = 1
ORDER BY i ASC
SETTINGS max_rows_to_read = 2;

SELECT i
FROM a
WHERE _part_offset = 2
ORDER BY i ASC
SETTINGS max_rows_to_read = 2;

SELECT i
FROM a
WHERE _part_offset = 3
ORDER BY i ASC
SETTINGS max_rows_to_read = 2;

SELECT i
FROM a
WHERE _part_offset = 4
ORDER BY i ASC
SETTINGS max_rows_to_read = 1;

SELECT i
FROM a
WHERE _part_offset IN (1, 4)
ORDER BY i ASC
SETTINGS max_rows_to_read = 3;

SELECT i
FROM a
WHERE _part_offset NOT IN (1, 4)
ORDER BY i ASC
SETTINGS max_rows_to_read = 4;

SELECT i
FROM a
WHERE _part_offset = 4
ORDER BY i ASC
SETTINGS force_primary_key = 1;

SELECT i
FROM a
WHERE i = -3
    OR _part_offset = 4
ORDER BY i ASC
SETTINGS force_primary_key = 1;

SELECT i
FROM b
WHERE (_part = 'all_1_1_0'
    AND _part_offset IN (1, 4))
    OR (_part = 'all_2_2_0'
    AND _part_offset IN (0, 4))
ORDER BY i ASC
SETTINGS max_rows_to_read = 6;