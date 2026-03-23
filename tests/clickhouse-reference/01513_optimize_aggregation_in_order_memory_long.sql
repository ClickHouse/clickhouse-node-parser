create table data_01513 (key String) engine=MergeTree() order by key;
-- 10e3 groups, 1e3 keys each
insert into data_01513 select number%10e3 from numbers(2e6);
-- this is enough to trigger non-reusable Chunk in Arena.
set max_memory_usage='500M';
set max_threads=1;
set max_block_size=500;
set max_bytes_before_external_group_by=0;
set max_bytes_ratio_before_external_group_by=0;
select key, groupArray(repeat('a', 200)), count() from data_01513 group by key format Null settings optimize_aggregation_in_order=0; -- { serverError MEMORY_LIMIT_EXCEEDED }
select key, groupArray(repeat('a', 200)), count() from data_01513 group by key format Null settings optimize_aggregation_in_order=1;
-- for WITH TOTALS previous groups should be kept.
select key, groupArray(repeat('a', 200)), count() from data_01513 group by key with totals format Null settings optimize_aggregation_in_order=1; -- { serverError MEMORY_LIMIT_EXCEEDED }
