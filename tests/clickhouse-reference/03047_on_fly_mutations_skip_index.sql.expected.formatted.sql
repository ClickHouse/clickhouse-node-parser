SELECT
    id,
    v
FROM t_lightweight_mut_3
WHERE v > 100
ORDER BY id ASC
SETTINGS force_data_skipping_indices = 'idx';

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT
            id,
            v
        FROM t_lightweight_mut_3
        WHERE v > 100
        ORDER BY id ASC
        SETTINGS force_data_skipping_indices = 'idx'
    )
WHERE like(s, 'Granules: %');

SELECT
    id,
    v
FROM t_lightweight_mut_3
WHERE v > 100
ORDER BY id ASC
SETTINGS apply_mutations_on_fly = 1;

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT
            id,
            v
        FROM t_lightweight_mut_3
        WHERE v > 100
        ORDER BY id ASC
        SETTINGS apply_mutations_on_fly = 1
    )
WHERE like(s, 'Granules: %');

SELECT
    id,
    v
FROM t_lightweight_mut_3
WHERE v > 100
ORDER BY id ASC
SETTINGS apply_mutations_on_fly = 0;

SELECT trim(`explain`) AS s
FROM (
        EXPLAIN indexes = 1
        SELECT
            id,
            v
        FROM t_lightweight_mut_3
        WHERE v > 100
        ORDER BY id ASC
        SETTINGS apply_mutations_on_fly = 0
    )
WHERE like(s, 'Granules: %');