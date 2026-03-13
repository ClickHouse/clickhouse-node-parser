SELECT *
FROM test_02381_compress
WHERE a = 1000
LIMIT 1;

-- Compare the size of marks on disk
SELECT
    table,
    sum(`rows`),
    sum(bytes_on_disk) AS sum_bytes,
    sum(marks_bytes) AS sum_marks_bytes,
    (sum_bytes - sum_marks_bytes) AS exclude_marks
FROM `system`.parts_columns
WHERE active
    AND database = currentDatabase()
    AND like(table, 'test_02381%')
GROUP BY table
ORDER BY table ASC;

SELECT *
FROM test_02381_compress
WHERE a = 10000
LIMIT 1;

SELECT *
FROM test_02381
WHERE a = 10000
LIMIT 1;

SELECT *
FROM test_02381_compact
ORDER BY a ASC;