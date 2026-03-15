SET enable_json_type = 1;
create table test (json JSON) engine=MergeTree order by tuple() settings min_rows_for_wide_part=0, min_bytes_for_wide_part=0;
select * from test;
select json.`a/b/c`, json.`a-b-c`, json.`a-b/c-d/e` from test;
select json.`a/b/c`.:Int64, json.`a-b-c`.:Int64, json.`a-b/c-d/e`.:Int64 from test;
