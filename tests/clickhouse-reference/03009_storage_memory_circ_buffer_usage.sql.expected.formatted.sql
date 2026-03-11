SELECT total_bytes
FROM `system`.tables
WHERE name = 'memory'
    AND database = currentDatabase();

SELECT total_rows
FROM `system`.tables
WHERE name = 'memory'
    AND database = currentDatabase();