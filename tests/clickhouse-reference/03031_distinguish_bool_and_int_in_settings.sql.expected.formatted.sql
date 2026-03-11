SELECT '-- Custom settings from system.settings';

SELECT
    name,
    value,
    type
FROM `system`.`settings`
WHERE startsWith(name, 'custom_')
ORDER BY name ASC;

SELECT
    'custom_f1' AS name,
    getSetting(name) AS value,
    toTypeName(value);

SELECT
    'custom_f2' AS name,
    getSetting(name) AS value,
    toTypeName(value);

SELECT
    'custom_f3' AS name,
    getSetting(name) AS value,
    toTypeName(value);

SELECT
    'custom_n0' AS name,
    getSetting(name) AS value,
    toTypeName(value);

SELECT
    'custom_n1' AS name,
    getSetting(name) AS value,
    toTypeName(value);

SELECT
    'custom_t1' AS name,
    getSetting(name) AS value,
    toTypeName(value);

SELECT
    'custom_t2' AS name,
    getSetting(name) AS value,
    toTypeName(value);

SELECT
    'custom_t3' AS name,
    getSetting(name) AS value,
    toTypeName(value);

SELECT
    name,
    value,
    type
FROM `system`.`settings`
WHERE name = 'async_insert';

SELECT
    'async_insert' AS name,
    getSetting(name) AS value,
    toTypeName(value);