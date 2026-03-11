select * from test order by agg1; -- {serverError ILLEGAL_COLUMN}
select agg1 < agg2 from test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
select agg1 <= agg2 from test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
select agg1 > agg2 from test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
select agg1 >= agg2 from test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
select agg1 = agg2 from test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
select agg1 != agg2 from test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
