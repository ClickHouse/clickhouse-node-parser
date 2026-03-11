SELECT
    length(name),
    name,
    '.'
FROM `system`.users
WHERE position(name, ' ') != 0
ORDER BY name ASC;