SELECT
    table,
    `partition`,
    active,
    level
FROM `system`.parts
WHERE table = 'optimize_final'
    AND database = currentDatabase()
    AND active = 1;