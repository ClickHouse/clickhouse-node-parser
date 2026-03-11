SELECT v
FROM replica1
ORDER BY v ASC;

SELECT name
FROM `system`.detached_parts
WHERE table = 'replica2'
    AND database = currentDatabase();

SELECT '-- drop part --';

SELECT name
FROM `system`.parts
WHERE table = 'replica2'
    AND active
    AND database = currentDatabase();