SELECT *
FROM test
ORDER BY `ALL` ASC;

-- SELECT * FROM system.part_log WHERE database = currentDatabase() FORMAT Vertical;
SELECT DISTINCT throwIf(empty(`partition`))
FROM `system`.part_log
WHERE database = currentDatabase();