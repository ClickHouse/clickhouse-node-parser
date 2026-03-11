SELECT
    'system.distribution_queue',
    count()
FROM `system`.distribution_queue
WHERE exists((
        SELECT 1
    ))
    AND database = currentDatabase();

SELECT
    'system.rocksdb',
    count() > 0
FROM `system`.rocksdb
WHERE exists((
        SELECT 1
    ))
    AND database = currentDatabase();

SELECT
    'system.databases',
    count()
FROM `system`.databases
WHERE exists((
        SELECT 1
    ))
    AND database = currentDatabase();

SELECT
    'system.mutations',
    count()
FROM `system`.mutations
WHERE exists((
        SELECT 1
    ))
    AND database = currentDatabase();

SELECT
    'system.replication_queue',
    count() > 0
FROM `system`.replication_queue
WHERE exists((
        SELECT 1
    ))
    AND database = currentDatabase();