SET output_format_pretty_display_footer_column_names=0;
SET output_format_pretty_color=1;
SET read_in_order_two_level_merge_threshold=1000000;
CREATE TABLE t(a UInt64)
ENGINE = MergeTree
ORDER BY a
SETTINGS index_granularity = 8192;
