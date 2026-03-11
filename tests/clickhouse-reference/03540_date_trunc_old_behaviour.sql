select dateTrunc('second', '2020-10-10 10:10:10.10'::DateTime64(2)) as result, toTypeName(result);
select dateTrunc('month', '2020-10-10'::Date32) as result, toTypeName(result);
