SELECT
    b,
    c,
    count()
FROM t_apply_patches
GROUP BY
    b,
    c
ORDER BY
    b ASC,
    c ASC;

SELECT
    b,
    c,
    count()
FROM t_apply_patches
GROUP BY
    b,
    c
ORDER BY
    b ASC,
    c ASC
SETTINGS apply_patch_parts = 0;

SELECT
    ProfileEvents['MutationSomePartColumns'],
    ProfileEvents['MutatedUncompressedBytes']
FROM `system`.part_log
WHERE database = currentDatabase()
    AND table = 't_apply_patches'
    AND event_type = 'MutatePart'
ORDER BY `ALL` ASC;

SELECT
    b,
    c,
    count()
FROM t_apply_patches_smt
GROUP BY
    b,
    c
ORDER BY
    b ASC,
    c ASC;

SELECT
    ProfileEvents['MutationSomePartColumns'],
    ProfileEvents['MutatedUncompressedBytes']
FROM `system`.part_log
WHERE database = currentDatabase()
    AND table = 't_apply_patches_smt'
    AND event_type = 'MutatePart'
ORDER BY `ALL` ASC;