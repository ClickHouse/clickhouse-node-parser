create table t (c Decimal32(9)) engine MergeTree order by c;
select * from t where c < 1.2;
