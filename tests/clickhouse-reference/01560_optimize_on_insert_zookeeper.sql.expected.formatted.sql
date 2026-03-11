SELECT *
FROM empty1
ORDER BY key ASC;

SELECT *
FROM empty2
ORDER BY key ASC;

SELECT
    table,
    `partition`,
    active
FROM `system`.parts
WHERE table = 'empty1'
    AND database = currentDatabase()
    AND active = 1;

SELECT
    table,
    `partition`,
    active
FROM `system`.parts
WHERE table = 'empty2'
    AND database = currentDatabase()
    AND active = 1;