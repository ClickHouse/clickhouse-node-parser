CREATE TABLE test(a Int, b Int) Engine=ReplacingMergeTree order by a SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
set optimize_on_insert = 0;
set max_threads =1;
select * from test final;
set max_threads =2;
