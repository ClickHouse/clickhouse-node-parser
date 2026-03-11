SELECT sleep(5)
FORMAT Null;

SELECT sleep(1)
FORMAT Null;

SELECT
    extractAll(logger_name, 'StorageBuffer \\([^.]+\\.([^)]+)\\)')[1] AS table_name,
    max2(count(), 20)
FROM `system`.text_log
WHERE like(logger_name, format('%StorageBuffer ({}.%', currentDatabase()))
GROUP BY 1
ORDER BY 1 ASC;