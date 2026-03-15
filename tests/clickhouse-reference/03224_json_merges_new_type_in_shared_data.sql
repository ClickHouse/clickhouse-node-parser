SET enable_json_type = 1;
create table test (json JSON(max_dynamic_paths=1)) engine=MergeTree order by tuple() settings min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1;
select distinct dynamicType(json.b) as type, isDynamicElementInSharedData(json.b) from test order by type;
