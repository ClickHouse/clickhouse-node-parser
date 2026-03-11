SELECT data_uncompressed_bytes
FROM `system`.`columns`
WHERE (database = currentDatabase())
    AND (table = 'clear_column')
    AND (name = 'num');

SELECT
    num,
    str
FROM clear_column
ORDER BY num ASC;

SELECT
    data_compressed_bytes,
    data_uncompressed_bytes
FROM `system`.`columns`
WHERE (database = currentDatabase())
    AND (table = 'clear_column')
    AND (name = 'num');

SELECT sleep(1)
FORMAT Null;

SELECT *
FROM clear_column2
ORDER BY
    d ASC,
    i ASC,
    s ASC;

SELECT DISTINCT *
FROM clear_column2
ORDER BY
    d ASC,
    i ASC,
    s ASC;

SELECT sum(data_uncompressed_bytes)
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND like(table, 'clear_column_')
    AND ((name = 'i'
    OR name = 's'))
GROUP BY table;