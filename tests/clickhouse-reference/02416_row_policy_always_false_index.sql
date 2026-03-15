create table tbl (s String, i int) engine MergeTree order by i;
create row policy filter on tbl using 0 to all;
set max_rows_to_read = 0;
select * from tbl;
