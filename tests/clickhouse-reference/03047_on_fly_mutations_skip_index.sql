SELECT id, v FROM t_lightweight_mut_3 WHERE v > 100 ORDER BY id SETTINGS force_data_skipping_indices = 'idx';
SELECT trim(explain) AS s FROM (
    EXPLAIN indexes = 1
    SELECT id, v FROM t_lightweight_mut_3 WHERE v > 100 ORDER BY id SETTINGS force_data_skipping_indices = 'idx'
) WHERE s LIKE 'Granules: %';
SELECT id, v FROM t_lightweight_mut_3 WHERE v > 100 ORDER BY id SETTINGS apply_mutations_on_fly = 1;
SELECT trim(explain) AS s FROM (
    EXPLAIN indexes = 1
    SELECT id, v FROM t_lightweight_mut_3 WHERE v > 100 ORDER BY id SETTINGS apply_mutations_on_fly = 1
) WHERE s LIKE 'Granules: %';
SELECT id, v FROM t_lightweight_mut_3 WHERE v > 100 ORDER BY id SETTINGS apply_mutations_on_fly = 0;
SELECT trim(explain) AS s FROM (
    EXPLAIN indexes = 1
    SELECT id, v FROM t_lightweight_mut_3 WHERE v > 100 ORDER BY id SETTINGS apply_mutations_on_fly = 0
) WHERE s LIKE 'Granules: %';
