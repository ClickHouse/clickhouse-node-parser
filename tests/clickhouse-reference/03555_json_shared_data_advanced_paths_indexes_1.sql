-- Tags: no-s3-storage, long, no-msan, no-tsan, no-asan, no-ubsan

set output_format_json_quote_64bit_integers=0;
create table test (json JSON(max_dynamic_paths=0)) engine=MergeTree order by tuple() settings index_granularity=1, min_bytes_for_wide_part='200G', min_rows_for_wide_part=1, write_marks_for_substreams_in_compact_parts=0, object_serialization_version='v3', object_shared_data_serialization_version='advanced', object_shared_data_serialization_version_for_zero_level_parts='advanced', object_shared_data_buckets_for_compact_part=1;
select sipHash64(json::String) from test order by all;
