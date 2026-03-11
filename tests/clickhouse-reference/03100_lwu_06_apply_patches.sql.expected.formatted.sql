SELECT *
FROM t_shared
ORDER BY id ASC
SETTINGS apply_patch_parts = 1;

SELECT *
FROM t_shared
ORDER BY id ASC
SETTINGS apply_patch_parts = 0;

SELECT
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_shared'
    AND active
ORDER BY name ASC;