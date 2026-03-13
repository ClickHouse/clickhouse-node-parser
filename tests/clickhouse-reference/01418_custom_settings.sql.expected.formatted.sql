SELECT
    getSetting('custom_a') AS v,
    toTypeName(v);

SELECT
    name,
    value
FROM `system`.`settings`
WHERE like(name, 'custom_%')
ORDER BY name ASC;

SELECT
    getSetting('custom_e') AS v,
    toTypeName(v); -- { serverError UNKNOWN_SETTING } -- Setting not found.

SELECT
    name,
    value
FROM `system`.`settings`
WHERE name = 'custom_e';

SELECT
    getSetting('custom_f') AS v,
    toTypeName(v); -- { serverError UNKNOWN_SETTING } -- Setting not found.

SELECT COUNT()
FROM `system`.`settings`
WHERE name = 'custom_f';

SELECT
    getSetting('custom_compound.identifier.v1') AS v,
    toTypeName(v);

SELECT
    name,
    value
FROM `system`.`settings`
WHERE name = 'custom_compound.identifier.v1';

SELECT
    getSetting('custom_null') AS v,
    toTypeName(v);

SELECT
    name,
    value
FROM `system`.`settings`
WHERE name = 'custom_null';