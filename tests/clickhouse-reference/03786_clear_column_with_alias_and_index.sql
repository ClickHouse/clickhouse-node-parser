CREATE TABLE test
    (
        x UInt8,
        INDEX x_idx x TYPE minmax GRANULARITY 1,
        z String DEFAULT 'Hello'
    )
    ENGINE = MergeTree ORDER BY tuple()
    SETTINGS add_minmax_index_for_numeric_columns=0, min_bytes_for_wide_part=1000, alter_column_secondary_index_mode='throw';
SELECT 'alias_before_clear', min(x), max(x) FROM test;
SELECT 'alias_after_clear', min(x), max(x) FROM test;
