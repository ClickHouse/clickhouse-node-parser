create table test (id UInt64, json JSON) engine=CoalescingMergeTree order by id settings min_bytes_for_wide_part='100G', merge_max_block_size=33, index_granularity=800;
insert into test select number, '{}' from numbers(10000);
