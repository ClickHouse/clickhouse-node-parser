SELECT uuid
FROM `system`.tables
WHERE database = currentDatabase()
    AND table = 'x';

SELECT replica_path
FROM `system`.replicas
WHERE database = currentDatabase()
    AND table = 'x';