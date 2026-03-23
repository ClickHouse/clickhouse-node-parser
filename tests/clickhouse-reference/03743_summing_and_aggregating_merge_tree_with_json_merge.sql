set mutations_sync=1;
create table test (id UInt64, json JSON) engine=SummingMergeTree order by id settings min_bytes_for_wide_part=1, min_rows_for_wide_part=1, index_granularity=32, merge_max_block_size=32;
insert into test select number, '{}' from numbers(100);
select distinct arrayJoin(JSONDynamicPaths(json)) from test;
select distinct arrayJoin(JSONSharedDataPaths(json)) from test;
create table test (id UInt64, json JSON) engine=AggregatingMergeTree order by id settings min_bytes_for_wide_part=1, min_rows_for_wide_part=1, index_granularity=32, merge_max_block_size=32;
create table test (id UInt64, json JSON) engine=CoalescingMergeTree order by id settings min_bytes_for_wide_part=1, min_rows_for_wide_part=1, index_granularity=32, merge_max_block_size=32;
