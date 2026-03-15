set enable_json_type=1;
set output_format_native_write_json_as_string=0;
create table test (json1 JSON(max_dynamic_paths=2, a UInt32), json2 JSON(max_dynamic_paths=2, a UInt32)) engine=Memory;
select json1, json2, json1 == json2, json1 != json2 from test;
