-- Tags: long
-- Random settings limits: index_granularity=(100, None)

set allow_experimental_dynamic_type = 1;
set max_block_size = 1000;
create table test (d Dynamic) engine=MergeTree order by tuple();
select distinct dynamicType(d) as type, isDynamicElementInSharedData(d) as flag from test order by type;
create table test (d Dynamic(max_types=1)) engine=MergeTree order by tuple();
