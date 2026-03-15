set enable_named_columns_in_function_tuple = 1;
set enable_analyzer = 1;
create table x (i int, j int) engine MergeTree order by i;
select toTypeName(tuple(i, j)) from x;
select tupleNames(tuple(i, j)) from x;
select toTypeName(tuple(1, j)) from x;
select tupleNames(tuple(1, j)) from x;
select toTypeName(tuple(1 as k, j)) from x;
select tupleNames(tuple(1 as k, j)) from x;
select toTypeName(tuple(i, i, j, j)) from x;
select tupleNames(tuple(i, i, j, j)) from x;
select tupleNames(1); -- { serverError 43 }
-- Make sure named tuple won't break Values insert
create table tbl (x Tuple(a Int32, b Int32, c Int32)) engine MergeTree order by ();
select * from tbl;
-- Avoid generating named tuple for special keywords
select toTypeName(tuple(null)), toTypeName(tuple(true)), toTypeName(tuple(false));
