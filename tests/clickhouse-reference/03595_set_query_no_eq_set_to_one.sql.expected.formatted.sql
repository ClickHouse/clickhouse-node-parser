SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name = 'force_index_by_date'
SETTINGS force_index_by_date = 1;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name = 'force_index_by_date'
SETTINGS force_index_by_date = 0;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name = 'force_index_by_date'
SETTINGS force_index_by_date = 1;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name = 'force_index_by_date'
SETTINGS force_index_by_date = DEFAULT;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name = 'force_index_by_date'
SETTINGS force_index_by_date = 1
FORMAT CSV;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name IN ('force_index_by_date', 'log_queries')
ORDER BY name ASC
SETTINGS
    force_index_by_date = 1,
    log_queries = 1;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name IN ('force_index_by_date', 'log_queries')
ORDER BY name ASC
SETTINGS
    force_index_by_date = 0,
    log_queries = 1;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name IN ('force_index_by_date', 'log_queries')
ORDER BY name ASC
SETTINGS
    force_index_by_date = 1,
    log_queries = 0;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name IN ('force_index_by_date', 'log_queries')
SETTINGS
    force_index_by_date = 1,
    log_queries = 1
FORMAT CSV;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name = 'force_index_by_date';

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name IN ('force_index_by_date', 'log_queries')
ORDER BY name ASC;

SELECT id
FROM t
ORDER BY id ASC;