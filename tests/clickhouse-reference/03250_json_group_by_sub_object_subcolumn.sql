SET enable_json_type = 1;
set allow_experimental_variant_type = 1;
set use_variant_as_common_type = 1;
create table test (json JSON(max_dynamic_paths = 20, `a.b.c` UInt32)) engine = Memory;
select json.^a from test group by json.^a order by toString(json.^a);
