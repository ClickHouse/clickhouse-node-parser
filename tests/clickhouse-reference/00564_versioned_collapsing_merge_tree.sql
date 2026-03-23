-- Tags: no-random-merge-tree-settings

set allow_deprecated_syntax_for_merge_tree=1;
set optimize_on_insert = 0;
set optimize_trivial_insert_select = 1;
create table mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date), 8192, sign, version);
insert into mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 10;
select * from mult_tab final order by date, value, sign;
select * from mult_tab;
select '-------------------------';
create table mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date, value), 8192, sign, version);
insert into mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 10;
insert into mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 2, -1, 1) from system.numbers limit 10;
select * from mult_tab final order by date, value, version, sign;
insert into mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 3 = 0, 1, -1) from system.numbers limit 10;
insert into mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 3 = 1, 1, -1) from system.numbers limit 10;
insert into mult_tab select '2018-01-31', 'str_' || toString(number), 1, if(number % 3 = 2, 1, -1) from system.numbers limit 10;
insert into mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, 1, -1) from system.numbers limit 1000000;
insert into mult_tab select '2018-01-31', 'str_' || toString(number), 0, if(number % 2, -1, 1) from system.numbers limit 1000000;
create table mult_tab (date Date, value UInt64, key UInt64, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(date, (date), 8192, sign, version);
insert into mult_tab select '2018-01-31', number, number, 0, if(number < 64, 1, -1) from system.numbers limit 128;
insert into mult_tab select '2018-01-31', number, number + 128, 0, if(number < 64, -1, 1) from system.numbers limit 128;
select date, value, version, sign from mult_tab final order by date, key, sign settings max_block_size=33;
select date, value, version, sign from mult_tab;
create table mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
create table mult_tab (date Date, value String, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date, value) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
create table mult_tab (date Date, value UInt64, key UInt64, version UInt64, sign Int8) engine = VersionedCollapsingMergeTree(sign, version) order by (date) settings enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 0;
