set use_structure_from_insertion_table_in_table_functions = 1;
create table test_02249 (x UInt32, y String) engine=Memory();
select * from test_02249;
