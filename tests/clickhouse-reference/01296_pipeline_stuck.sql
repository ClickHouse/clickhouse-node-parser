drop table if exists data_01295;
create table data_01295 (key Int) Engine=AggregatingMergeTree() order by key;
insert into data_01295 values (1);
select * from data_01295;
insert into data_01295 select * from data_01295; -- no stuck for now
insert into data_01295 select * from data_01295 final settings max_threads=2; -- stuck with multiple threads
set max_insert_threads=2;
drop table data_01295;
