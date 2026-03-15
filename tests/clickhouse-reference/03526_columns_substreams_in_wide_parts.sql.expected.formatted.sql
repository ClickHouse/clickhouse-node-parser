CREATE TABLE test
(
    int UInt32,
    str String,
    t Tuple(
        a UInt32,
        b Array(UInt32)),
    json JSON(a UInt32, b Array(String)),
    nested Nested(a UInt32, b UInt32)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1, vertical_merge_algorithm_min_rows_to_activate = 1000000, vertical_merge_algorithm_min_columns_to_activate = 100000, object_serialization_version = 'v2', enable_block_number_column = 0, enable_block_offset_column = 0, replace_long_file_name_to_hash = 0, escape_variant_subcolumn_filenames = 0, serialization_info_version = 'basic';

SELECT
    column,
    type,
    substreams,
    filenames
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 'test'
    AND active;

SELECT '-------------------------------------------------------------------------';