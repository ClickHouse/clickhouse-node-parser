SELECT count()
FROM `system`.projection_parts
WHERE database = currentDatabase()
    AND table = 't'
    AND active;