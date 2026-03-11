SELECT
    name,
    table
FROM `system`.tables
WHERE database = 'system'
    AND name = 'numbers';

SELECT
    name,
    database
FROM `system`.databases
WHERE name = 'default';