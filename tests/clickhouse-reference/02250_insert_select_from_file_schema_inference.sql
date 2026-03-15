set use_structure_from_insertion_table_in_table_functions = 1;
create table test_02250 (x Nullable(UInt32)) engine=Memory();
select * from test_02250;
