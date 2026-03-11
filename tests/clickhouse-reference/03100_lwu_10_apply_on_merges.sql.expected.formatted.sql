SELECT
    sum(u),
    countIf(endsWith(s, '_foo'))
FROM t_lwu_merges
SETTINGS apply_patch_parts = 0;

SELECT
    sum(u),
    countIf(endsWith(s, '_foo'))
FROM t_lwu_merges
SETTINGS apply_patch_parts = 1;