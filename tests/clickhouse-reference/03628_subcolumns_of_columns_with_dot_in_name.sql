select my.json.a from test settings enable_analyzer=1;
select `my.json`.a from test settings enable_analyzer=1;
select my.json.a from test settings enable_analyzer=0;
select `my.json`.a from test settings enable_analyzer=0;
select `t.t`.a from format(JSONEachRow, '`t.t` Tuple(a UInt32)', '{"t.t" : {"a" : 42}}');
select * from test;
select * from test order by my.json.a;
select * from test order by my.json.b::Int32;
select * from test order by my.tuple.a;
