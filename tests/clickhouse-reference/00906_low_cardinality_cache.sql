-- Tags: long

SET max_rows_to_read = '100M', max_execution_time = 600;
create table lc_00906 (b LowCardinality(String)) engine=MergeTree order by b SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi', vertical_merge_algorithm_min_rows_to_activate=100000000;
select count(), b from lc_00906 group by b;
