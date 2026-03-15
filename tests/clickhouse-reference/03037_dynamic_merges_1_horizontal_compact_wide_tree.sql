-- Tags: long, no-tsan, no-msan, no-ubsan, no-asan
-- Random settings limits: index_granularity=(100, None); merge_max_block_size=(100, None)

set allow_experimental_dynamic_type=1;
create table test (id UInt64, d Dynamic(max_types=2)) engine=MergeTree order by id settings min_rows_for_wide_part=1, min_bytes_for_wide_part=1, vertical_merge_algorithm_min_columns_to_activate=10, index_granularity_bytes=10485760, index_granularity=8192, merge_max_block_size=8192, merge_max_block_size_bytes=10485760, lock_acquire_timeout_for_background_operations=600;
select count(), dynamicType(d), isDynamicElementInSharedData(d) from test group by dynamicType(d), isDynamicElementInSharedData(d) order by count(), dynamicType(d);
select '---------------------';
