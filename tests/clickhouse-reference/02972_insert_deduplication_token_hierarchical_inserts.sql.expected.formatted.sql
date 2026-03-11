SELECT sleep(3);

SELECT
    table,
    name,
    error
FROM `system`.part_log
WHERE database = currentDatabase()
    AND error != 389
ORDER BY
    table ASC,
    name ASC;

SELECT count()
FROM landing;