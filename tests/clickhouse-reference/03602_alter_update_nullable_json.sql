set mutations_sync=1;
set max_block_size=1000;
create table test (id UInt32, json Nullable(JSON(max_dynamic_paths=1))) engine=MergeTree order by tuple() settings min_bytes_for_wide_part='200G';
select distinct arrayJoin(JSONDynamicPaths(assumeNotNull(json))) from test;
select distinct arrayJoin(JSONSharedDataPaths(assumeNotNull(json))) from test;
create table test (id UInt32, json Nullable(JSON(max_dynamic_paths=1))) engine=MergeTree order by tuple() settings min_bytes_for_wide_part=1, min_rows_for_wide_part=1;
