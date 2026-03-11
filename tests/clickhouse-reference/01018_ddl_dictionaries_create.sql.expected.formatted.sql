SELECT
    database,
    name
FROM `system`.dictionaries
WHERE database = 'db_01018'
    AND like(name, 'dict1');

SELECT
    database,
    name
FROM `system`.dictionaries
WHERE database = 'memory_db'
    AND like(name, 'dict2');