CREATE TABLE data_02771
(
    key Int,
    x Int,
    y Int,
    INDEX x_idx x TYPE minmax GRANULARITY 1,
    INDEX y_idx y TYPE minmax GRANULARITY 1,
    INDEX xy_idx tuple(x, y) TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY key;

SELECT *
FROM data_02771;

SELECT *
FROM data_02771
SETTINGS ignore_data_skipping_indices = ''; -- { serverError CANNOT_PARSE_TEXT }

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
    force_data_skipping_indices = 'xy_idx'; -- { serverError INDEX_NOT_USED }

SELECT *
FROM data_02771
WHERE x = 1
    AND y = 2
SETTINGS ignore_data_skipping_indices = 'xy_idx';

SET enable_analyzer = 0;

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

SET enable_analyzer = 1;