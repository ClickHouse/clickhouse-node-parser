SELECT *
FROM test
ORDER BY `ALL` ASC;

SELECT DISTINCT throwIf(empty(`partition`))
FROM `system`.part_log
WHERE database = currentDatabase();