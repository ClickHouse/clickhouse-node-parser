select toTypeName(tuple(i, j)) from x;
select tupleNames(tuple(i, j)) from x;
select toTypeName(tuple(1, j)) from x;
select tupleNames(tuple(1, j)) from x;
select toTypeName(tuple(1 as k, j)) from x;
select tupleNames(tuple(1 as k, j)) from x;
select toTypeName(tuple(i, i, j, j)) from x;
select tupleNames(tuple(i, i, j, j)) from x;
select tupleNames(1); -- { serverError 43 }
select * from tbl;
-- Avoid generating named tuple for special keywords
select toTypeName(tuple(null)), toTypeName(tuple(true)), toTypeName(tuple(false));
