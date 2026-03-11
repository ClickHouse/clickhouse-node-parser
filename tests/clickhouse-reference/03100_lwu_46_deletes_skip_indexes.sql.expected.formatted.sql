SELECT count()
FROM t_lwd_indexes
WHERE key = 1000
SETTINGS force_data_skipping_indices = 'idx_key';

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM t_lwd_indexes
        WHERE key = 1000
        SETTINGS force_data_skipping_indices = 'idx_key'
    )
WHERE like(`explain`, '%Granules%');

SELECT count()
FROM t_lwd_indexes
WHERE key = 9000
SETTINGS force_data_skipping_indices = 'idx_key';

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM t_lwd_indexes
        WHERE key = 9000
        SETTINGS force_data_skipping_indices = 'idx_key'
    )
WHERE like(`explain`, '%Granules%');

SELECT count()
FROM t_lwd_indexes
WHERE value = 'v1000'
SETTINGS force_data_skipping_indices = 'idx_value';

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM t_lwd_indexes
        WHERE value = 'v1000'
        SETTINGS force_data_skipping_indices = 'idx_value'
    )
WHERE like(`explain`, '%Granules%');

SELECT count()
FROM t_lwd_indexes
WHERE value = 'v9000'
SETTINGS force_data_skipping_indices = 'idx_value';

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM t_lwd_indexes
        WHERE value = 'v9000'
        SETTINGS force_data_skipping_indices = 'idx_value'
    )
WHERE like(`explain`, '%Granules%');