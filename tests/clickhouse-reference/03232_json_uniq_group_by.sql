SET enable_json_type = 1;
create table test (json JSON(a UInt32, max_dynamic_paths=2)) engine=Memory;
select uniqExact(json) from test;
select count(), json from test group by json order by toString(json);
