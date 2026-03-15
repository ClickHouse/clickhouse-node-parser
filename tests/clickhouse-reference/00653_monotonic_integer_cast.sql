create table `table_00653` (val Int32) engine = MergeTree order by val;
select count() from `table_00653` where toUInt64(val) == 0;
