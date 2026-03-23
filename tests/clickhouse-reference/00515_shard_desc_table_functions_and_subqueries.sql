-- Tags: shard

drop table if exists tab;
set allow_deprecated_syntax_for_merge_tree=1;
create table tab (date Date, val UInt64, val2 UInt8 default 42, val3 UInt8 default val2 + 1, val4 UInt64 alias val) engine = MergeTree(date, (date, val), 8192);
