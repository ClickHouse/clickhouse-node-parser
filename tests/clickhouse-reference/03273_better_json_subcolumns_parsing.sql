SET enable_json_type = 1;
create table test (json JSON) engine=Memory;
select dynamicType(json.a), json.a from test;
