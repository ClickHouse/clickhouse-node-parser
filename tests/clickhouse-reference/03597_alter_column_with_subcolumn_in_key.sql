create table test (id UInt32, t Tuple(a UInt32)) engine=MergeTree order by t.a;
create table test (id UInt32, json JSON) engine=MergeTree order by json.a::Int64;
