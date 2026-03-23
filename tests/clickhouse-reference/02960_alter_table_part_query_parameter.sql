create table data (key Int) engine=MergeTree() order by key;
insert into data values (1);
set param_part='all_1_1_0';
set param_part='all_2_2_0';
insert into data values (2);
set param_part='all_3_3_0';
