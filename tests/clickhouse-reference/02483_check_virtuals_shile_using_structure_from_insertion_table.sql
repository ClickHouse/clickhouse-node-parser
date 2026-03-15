create table test (line String, _file String, _path String) engine=Memory;
set use_structure_from_insertion_table_in_table_functions=2;
select line, _file from test;
