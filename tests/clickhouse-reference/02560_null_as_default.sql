create table test (x UInt64) engine=Memory();
set insert_null_as_default=1;
select * from test order by x;
create table test (x LowCardinality(String) default 'Hello') engine=Memory();
