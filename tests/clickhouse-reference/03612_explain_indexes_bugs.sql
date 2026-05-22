-- Tags: no-parallel-replicas
-- no-parallel-replicas because the output of explain is different.
-- add_minmax_index_for_numeric_columns=0: Different plan
set enable_analyzer = 1;
create table points (x Int64, y Int64) engine MergeTree order by (x, y) SETTINGS add_minmax_index_for_numeric_columns=0;
insert into points values (100, 100);
create table morton (x UInt64, y UInt64) engine MergeTree order by mortonEncode(x, y) SETTINGS add_minmax_index_for_numeric_columns=0;
insert into morton values (100, 200);
select x+y from morton where x+1 = 101;
