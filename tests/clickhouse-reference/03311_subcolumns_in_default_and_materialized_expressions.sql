set enable_json_type=1;
create table test (t Tuple(a UInt32), json JSON(b UInt32), a UInt32 default t.a, b UInt32 default json.b, c UInt32 default json.c) engine=Memory;
select * from test;
create table test (t Tuple(a UInt32), json JSON(b UInt32), a UInt32 materialized t.a, b UInt32 materialized json.b, c UInt32 materialized json.c) engine=Memory;
select *, a, b, c from test;
select * from format(JSONEachRow, 't Tuple(a UInt32), json JSON(b UInt32), a UInt32 default t.a, b UInt32 default json.b, c UInt32 default json.c', '{"t" : {"a" : 42}, "json" : {"b" : 42, "c" : 42}}');
