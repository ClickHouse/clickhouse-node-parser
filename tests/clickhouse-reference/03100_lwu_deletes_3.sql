SELECT 300000 - 10 * 3 - 1500 * 10 - 500 * 10 * 3 , 42 * 10 * 5, 0;
SELECT count(), sum(v1), sum(notEmpty(v2)) FROM t_lwu_deletes_3;
SELECT count(), uniqExact(partition_id), sum(rows)
FROM system.parts_columns
WHERE database = currentDatabase() AND table = 't_lwu_deletes_3' AND column = '_row_exists' AND active AND startsWith(name, 'patch');
SELECT count(), sum(v1), sum(notEmpty(v2)) FROM t_lwu_deletes_3 SETTINGS apply_patch_parts = 0;
SELECT sum(rows) FROM system.parts WHERE database = currentDatabase() AND table = 't_lwu_deletes_3' AND NOT startsWith(name, 'patch') AND active;
