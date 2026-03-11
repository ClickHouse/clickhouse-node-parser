SELECT
    'BEFORE',
    table,
    name,
    type,
    default_kind,
    default_expression
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'a'
ORDER BY
    table ASC,
    name ASC;

SELECT
    'AFTER',
    table,
    name,
    type,
    default_kind,
    default_expression
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'a'
ORDER BY
    table ASC,
    name ASC;