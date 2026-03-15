set enable_json_type=1;
set output_format_binary_write_json_as_string=1;
create table test (json JSON(max_dynamic_paths=0)) engine=Memory;
select * from test;
