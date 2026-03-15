create table t (n UInt32, a Array(Int32)) engine=Memory;
select array_concat_agg(a) from t;
select n, array_concat_agg(a) from t group by n order by n;
