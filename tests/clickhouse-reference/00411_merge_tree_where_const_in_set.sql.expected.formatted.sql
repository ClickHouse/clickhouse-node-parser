SELECT 1
FROM const_in_const
WHERE 42 IN (225);

SELECT name
FROM const_in_const
WHERE 1 IN (125, 1, 2)
ORDER BY name ASC
LIMIT 1;