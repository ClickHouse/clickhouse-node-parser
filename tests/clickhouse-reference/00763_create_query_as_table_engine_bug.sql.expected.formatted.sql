SELECT engine
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'td';