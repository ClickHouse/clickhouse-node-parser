set enable_json_type=1;
create table test (json JSON) engine=Memory;
select json.a.String from test;
select json.a.:String from test;
select json.a.UInt64 from test;
