create table data_01295 (key Int) Engine=AggregatingMergeTree() order by key;
select * from data_01295;
set max_insert_threads=2;
