create table test (json JSON(max_dynamic_paths=4)) engine=MergeTree order by tuple() settings min_bytes_for_wide_part='100G', merge_max_dynamic_subcolumns_in_compact_part=2;
select JSONDynamicPaths(json), JSONSharedDataPaths(json) from test;
select JSONDynamicPaths(json), JSONSharedDataPaths(json) from test limit 1;
create table test (x UInt32, json JSON(max_dynamic_paths=4)) engine=MergeTree order by tuple() settings min_bytes_for_wide_part='100G', merge_max_dynamic_subcolumns_in_compact_part=2, vertical_merge_algorithm_min_rows_to_activate=1, vertical_merge_algorithm_min_columns_to_activate=1;
