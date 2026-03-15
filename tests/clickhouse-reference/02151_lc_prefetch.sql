CREATE TABLE tab_lc (x UInt64, y LowCardinality(String)) engine = MergeTree order by x SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
SET max_rows_to_read = '21M';
select count() from tab_lc where y == '0' settings local_filesystem_read_prefetch=1;
