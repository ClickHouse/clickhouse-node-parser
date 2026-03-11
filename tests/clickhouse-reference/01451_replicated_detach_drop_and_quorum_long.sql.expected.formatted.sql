SELECT name
FROM `system`.parts
WHERE table = 'replica2'
    AND database = currentDatabase()
    AND active = 1;

SELECT *
FROM replica1;

SELECT *
FROM replica2;

SELECT name
FROM `system`.parts
WHERE table = 'replica1'
    AND database = currentDatabase()
    AND active = 1
ORDER BY name ASC;

SELECT COUNT()
FROM replica1;