set allow_deprecated_syntax_for_merge_tree=1;
create table nested_map_multiple_values (d materialized today(), k UInt64, payload materialized rand(), SomeMap Nested(ID UInt32, Num1 Int64, Num2 Float64)) engine=SummingMergeTree(d, k, 8192);
select * from nested_map_multiple_values;
create table nested_not_a_map (d materialized today(), k UInt64, payload materialized rand(), OnlyOneColumnMap Nested(ID UInt32), NonArithmeticValueMap Nested(ID UInt32, Date Date), Nested_ Nested(ID UInt32, Num Int64)) engine=SummingMergeTree(d, k, 8192);
select * from nested_not_a_map;
