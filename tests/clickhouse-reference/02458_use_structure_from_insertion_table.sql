create table test (x Nullable(UInt32), y UInt32) engine=Memory();
set use_structure_from_insertion_table_in_table_functions=2;
set input_format_json_infer_incomplete_types_as_strings=0;
select * from test order by y;
create table test (x Nullable(UInt32)) engine=Memory();
select * from test order by x;
