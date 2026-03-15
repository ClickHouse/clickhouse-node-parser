create table tbl(dt DateTime, i int, j String, v Float64) engine MergeTree partition by (toDate(dt), i % 2, length(j)) order by i settings index_granularity = 1;
set optimize_use_implicit_projections = 1;
select count() from tbl where _partition_value = ('2021-04-01', 1, 2) settings max_rows_to_read = 1;
select count() from tbl where _partition_value.1 = '2021-04-01' settings max_rows_to_read = 4;
select count() from tbl where _partition_value.2 = 0 settings max_rows_to_read = 4;
select count() from tbl where _partition_value.3 = 4 settings max_rows_to_read = 1;
create table tbl2(i int) engine MergeTree order by i;
select _partition_value from tbl2; -- { serverError UNKNOWN_IDENTIFIER }
select _partition_value from tbl2 group by 1; -- { serverError UNKNOWN_IDENTIFIER }
