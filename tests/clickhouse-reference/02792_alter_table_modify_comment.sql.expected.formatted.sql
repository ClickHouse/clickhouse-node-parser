SELECT comment
FROM `system`.tables
WHERE database = currentDatabase()
    AND table = 't';