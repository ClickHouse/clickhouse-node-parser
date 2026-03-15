create table t(n int, a Int64, s String) engine = MergeTree() order by a;
set enable_positional_arguments = 0;
set optimize_trivial_insert_select = 1;
set max_rows_to_read = 0;
select n, a, s from t order by n;
