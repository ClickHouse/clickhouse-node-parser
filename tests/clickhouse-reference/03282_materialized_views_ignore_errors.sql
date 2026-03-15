-- more blocks to process
set max_block_size = 10;
set min_insert_block_size_rows = 10;
create table testX (A Int64) engine=MergeTree partition by (intDiv(A, 10), throwIf(A=2)) order by tuple();
create materialized view testXA engine=MergeTree order by tuple() as select sleep(0.1) from testX;
select count() from testX;
select count() from testXA;
