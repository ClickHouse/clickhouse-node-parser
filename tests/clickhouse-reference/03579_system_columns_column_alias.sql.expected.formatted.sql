SELECT name
FROM `system`.`columns`
WHERE database = 'system'
    AND table = 'columns'
LIMIT 1;

SELECT column
FROM `system`.`columns`
WHERE database = 'system'
    AND table = 'columns'
LIMIT 1;

SELECT
    name,
    column,
    name = column AS alias_works
FROM `system`.`columns`
WHERE database = 'system'
    AND table = 'columns'
LIMIT 1;