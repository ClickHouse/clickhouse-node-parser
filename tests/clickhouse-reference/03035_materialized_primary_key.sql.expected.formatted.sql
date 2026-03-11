SELECT
    name,
    primary_key
FROM `system`.tables
WHERE database = currentDatabase()
    AND like(name, 'test%');