SET enable_analyzer = DEFAULT;

SELECT
    name,
    value,
    changed
FROM `system`.`settings`
WHERE name IN ('allow_experimental_analyzer', 'enable_analyzer')
ORDER BY name ASC;

SET compatibility = '24.8';

SET compatibility = '24.3';

SET compatibility = '24.1';