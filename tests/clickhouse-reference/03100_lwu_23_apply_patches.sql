SELECT b, c, count() FROM t_apply_patches GROUP BY b, c ORDER BY b, c;
SELECT b, c, count() FROM t_apply_patches GROUP BY b, c ORDER BY b, c SETTINGS apply_patch_parts = 0;
SELECT
    ProfileEvents['MutationSomePartColumns'],
    ProfileEvents['MutatedUncompressedBytes'] -- 2 * 8 * 10000 = 160000, because only 2 columns must be affected.
FROM system.part_log WHERE database = currentDatabase() AND table = 't_apply_patches' AND event_type = 'MutatePart'
ORDER BY ALL;
SELECT b, c, count() FROM t_apply_patches_smt GROUP BY b, c ORDER BY b, c;
SELECT
    ProfileEvents['MutationSomePartColumns'],
    ProfileEvents['MutatedUncompressedBytes'] -- 2 * 8 * 10000 = 160000, because only 2 columns must be affected.
FROM system.part_log WHERE database = currentDatabase() AND table = 't_apply_patches_smt' AND event_type = 'MutatePart'
ORDER BY ALL;
