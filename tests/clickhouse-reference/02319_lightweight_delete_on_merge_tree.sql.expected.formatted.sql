SELECT COUNT()
FROM merge_table_standard_delete;

SELECT '-----lightweight mutation type-----';

SELECT
    command,
    is_done
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_light';

SELECT count(*)
FROM t_light;

SELECT *
FROM t_light
ORDER BY a ASC;

SELECT
    table,
    `partition`,
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND active
    AND table = 't_light'
ORDER BY name ASC;

SELECT
    table,
    `partition`,
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND active
    AND table = 't_light'
    AND `rows` > 0
ORDER BY name ASC;

SELECT *
FROM t_large
WHERE a IN (1, 1000, 1005, 50000)
ORDER BY a ASC;

SELECT
    avg(a),
    avg(b),
    count()
FROM t_proj;