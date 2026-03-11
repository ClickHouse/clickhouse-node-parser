SELECT b
FROM t_lwu_sequence
WHERE a = 5
SETTINGS apply_patch_parts = 0;

SELECT b
FROM t_lwu_sequence
WHERE a = 5
SETTINGS apply_patch_parts = 1;

SELECT
    count(),
    sum(`rows`)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_lwu_sequence'
    AND startsWith(name, 'patch')
    AND active;