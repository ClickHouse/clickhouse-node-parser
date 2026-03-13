-- expecting no projection
SELECT name
FROM `system`.projection_parts
WHERE (database = currentDatabase())
    AND (table = 'tp')
    AND (active = 1);