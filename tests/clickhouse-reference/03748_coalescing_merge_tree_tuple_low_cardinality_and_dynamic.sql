set mutations_sync=1;
create table test (id UInt64, t Tuple(a LowCardinality(String), json JSON)) engine=CoalescingMergeTree order by id settings min_bytes_for_wide_part=1, min_rows_for_wide_part=1, index_granularity=32, merge_max_block_size=32;
select distinct arrayJoin(JSONDynamicPaths(t.json)) from test;
select distinct arrayJoin(JSONSharedDataPaths(t.json)) from test;
