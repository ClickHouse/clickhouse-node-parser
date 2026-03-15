set allow_experimental_variant_type=1;
create table test (x UInt64, d Variant(UInt64)) engine=Memory;
select d from test order by d::String limit 32213 format Null;
