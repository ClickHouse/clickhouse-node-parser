create table test (qbit QBit(Float64, 3)) engine=MergeTree order by tuple();
select * from test order by qbit; -- {serverError ILLEGAL_COLUMN}
select qbit < qbit from test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
