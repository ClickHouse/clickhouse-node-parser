create table data (
    key Int,
    `legacy_features_Map.id` Array(UInt8),
    `legacy_features_Map.count` Array(UInt32),
) engine=MergeTree()
order by key
settings
    min_bytes_for_wide_part=0,
    min_rows_for_wide_part=0,
    vertical_merge_algorithm_min_rows_to_activate=0,
    vertical_merge_algorithm_min_columns_to_activate=0;
