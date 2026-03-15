create table t(i8 Int8, i16 Int16, i32 Int32, i64 Int64) engine Memory;
select * apply bitmapMin, * apply bitmapMax from (select * apply groupBitmapState from t);
