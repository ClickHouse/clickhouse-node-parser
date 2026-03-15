set allow_experimental_dynamic_type=1;
create table test (d Dynamic) engine=Memory;
select d.UInt64 from test settings enable_analyzer=1;
select d.UInt64 from test settings enable_analyzer=0;
