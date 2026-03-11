SELECT
    name,
    value,
    changed
FROM `system`.`settings`
WHERE name IN ('allow_experimental_analyzer', 'enable_analyzer')
ORDER BY name ASC;