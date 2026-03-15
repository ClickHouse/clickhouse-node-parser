set allow_experimental_dynamic_type = 1;
set min_bytes_to_use_direct_io = 0;
create table test (id UInt64, d Dynamic) engine=MergeTree order by id settings min_rows_for_wide_part=1, min_bytes_for_wide_part=1, index_granularity=1, use_adaptive_write_buffer_for_dynamic_subcolumns=0, max_compress_block_size=8, min_compress_block_size=8,  use_compact_variant_discriminators_serialization=0;
select d.`LowCardinality(String)` from test settings max_threads=1;
