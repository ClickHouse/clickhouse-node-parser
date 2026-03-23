SET enable_analyzer = 1;

CREATE TABLE t_ind_merge_1
(
    a UInt64,
    b UInt64,
    c UInt64,
    d UInt64,
    INDEX idx_b b TYPE minmax
)
ENGINE = MergeTree
ORDER BY a
SETTINGS index_granularity = 64, merge_max_block_size = 8192, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 1, min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0, enable_block_number_column = 0, enable_block_offset_column = 0;

INSERT INTO t_ind_merge_1 SELECT
    number,
    number,
    rand(),
    rand()
FROM numbers(1000);

SELECT count()
FROM t_ind_merge_1
WHERE b < 100
SETTINGS force_data_skipping_indices = 'idx_b';

SET max_rows_to_read = 0; -- system.text_log can be really big