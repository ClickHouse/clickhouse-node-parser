set allow_deprecated_syntax_for_merge_tree=1;
create table nested_map (d default today(), k UInt64, payload default rand(), SomeMap Nested(ID UInt32, Num Int64)) engine=SummingMergeTree(d, k, 8192);
select `SomeMap.ID`, `SomeMap.Num` from nested_map;
create table nested_map (d default today(), k UInt64, payload default rand(), SomeMap Nested(ID String, Num Int64)) engine=SummingMergeTree(d, k, 8192);
create table nested_map_explicit (d default today(), k UInt64, SomeIntExcluded UInt32, SomeMap Nested(ID UInt32, Num Int64)) engine=SummingMergeTree(d, k, 8192, (SomeMap));
select `SomeIntExcluded`, `SomeMap.ID`, `SomeMap.Num` from nested_map_explicit;
