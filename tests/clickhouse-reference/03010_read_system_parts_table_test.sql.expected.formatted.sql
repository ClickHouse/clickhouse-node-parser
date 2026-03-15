CREATE TABLE users
(
    uid Int16,
    name String,
    age Int16
)
ENGINE = MergeTree
ORDER BY uid
PARTITION BY uid;

SELECT
    uuid,
    name
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'users';

SELECT
    uuid,
    name,
    table
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'users'
    AND uuid = '00000000-0000-0000-0000-000000000000';

SELECT
    uuid,
    name,
    table,
    column
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 'users'
    AND uuid = '00000000-0000-0000-0000-000000000000';