set enable_json_type=1;
create table test (json JSON) engine=Memory;
select json, notEmpty(json) from test;
create table test (json JSON(a UInt32)) engine=Memory;
create table test (json JSON(max_dynamic_paths=1)) engine=Memory;
create table test (json JSON(max_dynamic_paths=0)) engine=Memory;
