CREATE TABLE t_final_replacing (a UInt64, b UInt64) ENGINE = ReplacingMergeTree ORDER BY a SETTINGS index_granularity = 1;
SET optimize_read_in_order = 0;
SET split_parts_ranges_into_intersecting_and_non_intersecting_final = 0, split_intersecting_parts_ranges_into_layers_final = 0;
SELECT a, b FROM t_final_replacing FINAL ORDER BY a, b;
SET split_parts_ranges_into_intersecting_and_non_intersecting_final = 0, split_intersecting_parts_ranges_into_layers_final = 1;
SET split_parts_ranges_into_intersecting_and_non_intersecting_final = 1, split_intersecting_parts_ranges_into_layers_final = 0;
SET split_parts_ranges_into_intersecting_and_non_intersecting_final = 1, split_intersecting_parts_ranges_into_layers_final = 1;
