-- Tags: long, no-tsan, no-msan, no-ubsan, no-asan
-- Random settings limits: index_granularity=(100, None); merge_max_block_size=(100, None)

set allow_experimental_variant_type = 1;
set use_variant_as_common_type = 1;
set allow_experimental_dynamic_type = 1;
set enable_named_columns_in_function_tuple = 0;
create table test (id UInt64, d Dynamic(max_types=2)) engine=MergeTree order by id settings min_rows_for_wide_part=1000000000, min_bytes_for_wide_part=10000000000, lock_acquire_timeout_for_background_operations=600;
select count(), dynamicType(d) || ':' || dynamicType(d.`Tuple(a Dynamic(max_types=2))`.a) as type, isDynamicElementInSharedData(d.`Tuple(a Dynamic(max_types=2))`.a) as flag from test group by type, flag order by count(), type;
select '---------------------';
