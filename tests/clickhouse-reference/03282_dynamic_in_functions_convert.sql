set enable_dynamic_type = 1;
create table test (d Dynamic(max_types=3)) engine=Memory;
select toFloat64(d) from test;
select toUInt32(d) from test;
