SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_mergetree'
LIMIT 1;

SELECT *
FROM `02681_undrop_mergetree`
ORDER BY id ASC;

SELECT command
FROM `system`.mutations
WHERE table = '02681_undrop_detach'
    AND database = currentDatabase()
LIMIT 1;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_uuid_on_cluster'
LIMIT 1;

SELECT *
FROM `02681_undrop_uuid_on_cluster`
ORDER BY id ASC;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_no_uuid_on_cluster'
LIMIT 1;

SELECT *
FROM `02681_undrop_no_uuid_on_cluster`
ORDER BY id ASC;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_replicatedmergetree'
LIMIT 1;

SELECT *
FROM `02681_undrop_replicatedmergetree`
ORDER BY id ASC;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_log'
LIMIT 1;

SELECT *
FROM `02681_undrop_log`
ORDER BY id ASC;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_distributed'
LIMIT 1;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_multiple'
LIMIT 1;

SELECT *
FROM `02681_undrop_multiple`
ORDER BY id ASC;