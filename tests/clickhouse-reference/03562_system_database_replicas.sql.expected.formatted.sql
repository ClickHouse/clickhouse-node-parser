SELECT '-----------------------';

SELECT sleep(1)
FORMAT Null;

SELECT *
FROM `system`.database_replicas
WHERE like(database, 'db_%')
ORDER BY database ASC;

SELECT database
FROM `system`.database_replicas
WHERE like(database, 'db_%')
ORDER BY database ASC;

SELECT DISTINCT is_readonly
FROM `system`.database_replicas
WHERE like(database, 'db_%');

SELECT count(*)
FROM `system`.database_replicas
WHERE like(database, 'db_%');

SELECT *
FROM `system`.database_replicas
WHERE like(database, 'db_%')
ORDER BY database ASC
LIMIT 1;

SELECT *
FROM `system`.database_replicas
WHERE like(database, 'db_%')
ORDER BY database ASC
LIMIT 6;

SELECT *
FROM `system`.database_replicas
WHERE like(database, 'db_%')
ORDER BY database ASC
LIMIT 7;

SELECT *
FROM `system`.database_replicas
WHERE like(database, 'db_%')
    AND is_readonly = 0
ORDER BY database ASC;

SELECT *
FROM `system`.database_replicas
WHERE like(database, 'db_%')
    AND is_readonly = 1
ORDER BY database ASC;

SELECT is_readonly
FROM `system`.database_replicas
WHERE database = 'db_2'
ORDER BY database ASC;

SELECT *
FROM `system`.database_replicas
WHERE database = 'db_11'
ORDER BY database ASC;

SELECT
    database,
    max_log_ptr
FROM `system`.database_replicas
WHERE like(database, 'db_%')
    AND max_log_ptr > 1;