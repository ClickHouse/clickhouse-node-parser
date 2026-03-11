SELECT *
FROM t_shared
ORDER BY id ASC;

SELECT
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_shared'
    AND active
ORDER BY name ASC;