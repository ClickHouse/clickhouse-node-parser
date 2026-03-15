set enable_analyzer=1;
create table test (a JSON, `b.c` JSON, ab UInt64 alias a.b, bcd UInt64 alias b.c.d) engine=MergeTree order by tuple();
select ab, bcd from test;
