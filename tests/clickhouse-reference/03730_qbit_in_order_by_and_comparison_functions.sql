select * from test order by qbit; -- {serverError ILLEGAL_COLUMN}
select qbit < qbit from test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
