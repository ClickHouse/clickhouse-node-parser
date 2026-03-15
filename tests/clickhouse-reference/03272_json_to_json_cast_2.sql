-- Tags: long

SET enable_json_type = 1;
set enable_analyzer = 1;
set output_format_native_write_json_as_string = 0;
create table test (json JSON(max_dynamic_paths=4)) engine=Memory;
select json::JSON(max_dynamic_paths=3) as json2, JSONAllPaths(json2), JSONSharedDataPaths(json2), json2.k1, json2.k2, json2.k3, json2.k4 from test;
select json::JSON(max_dynamic_paths=2) as json2, JSONAllPaths(json2), JSONSharedDataPaths(json2), json2.k1, json2.k2, json2.k3, json2.k4 from test;
select json::JSON(max_dynamic_paths=1) as json2, JSONAllPaths(json2), JSONSharedDataPaths(json2), json2.k1, json2.k2, json2.k3, json2.k4 from test;
select json::JSON(max_dynamic_paths=0) as json2, JSONAllPaths(json2), JSONSharedDataPaths(json2), json2.k1, json2.k2, json2.k3, json2.k4 from test;
set max_block_size=1000;
set max_threads=1;
create table test (id UInt64, json JSON(max_dynamic_paths=4)) engine=MergeTree order by id settings min_rows_for_wide_part=1, min_bytes_for_wide_part=1;
select distinct arrayJoin(JSONAllPaths(json2)) from (select json::JSON(max_dynamic_paths=3) as json2 from test) order by all;
select distinct arrayJoin(JSONAllPaths(json2)) from (select json::JSON(max_dynamic_paths=2) as json2 from test) order by all;
select distinct arrayJoin(JSONAllPaths(json2)) from (select json::JSON(max_dynamic_paths=1) as json2 from test) order by all;
select distinct arrayJoin(JSONAllPaths(json2)) from (select json::JSON(max_dynamic_paths=0) as json2 from test) order by all;
