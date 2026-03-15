create table tbl (s String, i int) engine MergeTree order by i;
create row policy filter on tbl using (s = 'non_existing_domain') to all;
select * from tbl prewhere s = '123' where i = 123;
