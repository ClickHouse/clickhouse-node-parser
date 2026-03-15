set enable_json_type=1;
set enable_dynamic_type=1;
create table src (d Dynamic) engine=Memory;
create table dst (d Dynamic) engine=MergeTree order by tuple();
select isDynamicElementInSharedData(d) from dst;
create table src (json JSON) engine=Memory;
create table dst (json JSON) engine=MergeTree order by tuple();
select JSONSharedDataPaths(json) from dst;
