SELECT *
FROM t_lwu_sequential_1
ORDER BY id ASC
SETTINGS apply_patch_parts = 0;

SELECT *
FROM t_lwu_sequential_1
ORDER BY id ASC
SETTINGS apply_patch_parts = 1;