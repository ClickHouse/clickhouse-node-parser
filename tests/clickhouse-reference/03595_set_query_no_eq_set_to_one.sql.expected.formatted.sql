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

SET force_index_by_date = 1;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name = 'force_index_by_date';

SET force_index_by_date = DEFAULT;

SET force_index_by_date = 1;

SET force_index_by_date = 0;

SET force_index_by_date = DEFAULT, log_queries = DEFAULT;

SELECT
    name,
    value,
    changed,
    default
FROM `system`.`settings`
WHERE name IN ('force_index_by_date', 'log_queries')
ORDER BY name ASC;

SET force_index_by_date = 1, log_queries = 0;

SET force_index_by_date = 0, log_queries = 1;

SET force_index_by_date = 1, log_queries = 1;

CREATE TABLE t
(
    id UInt32
)
ENGINE = MergeTree
ORDER BY id
SETTINGS async_insert = 1, optimize_on_insert = 1;

SELECT id
FROM t
ORDER BY id ASC;