SET enable_json_type = 1;
create table test (json JSON(max_dynamic_paths=8)) engine=MergeTree order by tuple() settings min_bytes_for_wide_part=1, min_rows_for_wide_part=1;
select JSONAllPaths(arrayJoin(json.a[])) from test;
select JSONDynamicPaths(arrayJoin(json.a[])) from test;
select JSONSharedDataPaths(arrayJoin(json.a[])) from test;
