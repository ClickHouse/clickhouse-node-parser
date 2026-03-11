SELECT *
FROM data_02771;

SELECT *
FROM data_02771
SETTINGS ignore_data_skipping_indices = '';

SELECT *
FROM data_02771
SETTINGS ignore_data_skipping_indices = 'x_idx';

SELECT *
FROM data_02771
SETTINGS ignore_data_skipping_indices = 'na_idx';

SELECT *
FROM data_02771
WHERE x = 1
    AND y = 1
SETTINGS
    ignore_data_skipping_indices = 'xy_idx',
    force_data_skipping_indices = 'xy_idx';

SELECT *
FROM data_02771
WHERE x = 1
    AND y = 2
SETTINGS ignore_data_skipping_indices = 'xy_idx';

SELECT *
FROM (
        EXPLAIN indexes = 1
        SELECT *
        FROM data_02771
        WHERE x = 1
            AND y = 2
    )
WHERE notLike(`explain`, '%Expression%')
    AND notLike(`explain`, '%Filter%');

SELECT *
FROM (
        EXPLAIN indexes = 1
        SELECT *
        FROM data_02771
        WHERE x = 1
            AND y = 2
        SETTINGS ignore_data_skipping_indices = 'xy_idx'
    )
WHERE notLike(`explain`, '%Expression%')
    AND notLike(`explain`, '%Filter%');