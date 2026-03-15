create table mt_compact (a Int, s String) engine = MergeTree order by a partition by a
settings index_granularity_bytes = 0;
create table mt_compact_2 (a Int, s String) engine = MergeTree order by a partition by a
settings min_rows_for_wide_part = 1000;
set send_logs_level = 'error';
create table mt_compact (a Int, s String) engine = MergeTree order by a partition by a
settings index_granularity_bytes = 0, min_rows_for_wide_part = 1000;
