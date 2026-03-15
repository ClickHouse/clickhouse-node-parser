set allow_deprecated_syntax_for_merge_tree=1;
create table `table_00483` (date Date, `Struct.Key1` Array(UInt64), `Struct.Key2` Array(UInt64), padding FixedString(16)) engine = MergeTree(date, (date), 16);
set preferred_max_column_in_block_size_bytes = 96;
select blockSize(), * from `table_00483` prewhere `Struct.Key1`[1] = 19 and `Struct.Key2`[1] >= 0 format Null;
create table `table_00483` (date Date, `Struct.Key1` Array(UInt64), `Struct.Key2` Array(UInt64), padding FixedString(16), x UInt64) engine = MergeTree(date, (date), 8);
set preferred_max_column_in_block_size_bytes = 112;
select blockSize(), * from `table_00483` prewhere x = 7 format Null;
