-- Tags: long, no-azure-blob-storage

set output_format_json_quote_64bit_integers=0;
create table source (json JSON(max_dynamic_paths=8)) engine=Memory;
insert into source format JSONAsObject
{"?1" : 1, "?2" : 1, "?3" : 1, "?4" : 1, "?5" : 1, "?6" : 1, "?7" : 1, "?8" : 1, "a" : {"a1" : 1, "a2" : 2, "arr" : [{"arr1" : 3, "arr2" : 4, "arr3" : 5, "arr4" : 6}]}, "b" : 7, "c" : 8, "arr" : [{"arr1" : 9, "arr2" : 10, "arr3" : 11, "arr4" : 12}]}
{"a" : {"a1" : 2, "a2" : 3, "arr" : [{"arr1" : 4, "arr2" : 5, "arr3" : 6, "arr4" : 7}]}, "b" : 8, "c" : 9, "arr" : [{"arr1" : 10, "arr2" : 11, "arr3" : 12, "arr4" : 13}]}
{}
{}
{"a" : {"a1" : 3, "a2" : 4, "arr" : [{"arr1" : 5, "arr2" : 6, "arr3" : 7, "arr4" : 8}]}}
{"a" : {"a1" : 4, "a2" : 5, "arr" : [{"arr1" : 6, "arr2" : 7, "arr3" : 8, "arr4" : 9}]}}
{"b" : 9, "c" : 10}
{"b" : 10, "c" : 11}
{"arr" : [{"arr1" : 11, "arr2" : 12, "arr3" : 13, "arr4" : 14}]}
{"arr" : [{"arr1" : 12, "arr2" : 13, "arr3" : 14, "arr4" :15 }]}
{"a" : {"a1" : 5, "a2" : 6}}
{"a" : {"a1" : 6, "a2" : 7}};
create table test_compact_without_substreams_advanced (json JSON(max_dynamic_paths=8)) engine=MergeTree order by tuple() settings index_granularity=2, min_bytes_for_wide_part='200G', min_rows_for_wide_part=1, write_marks_for_substreams_in_compact_parts=0, object_serialization_version='v3', object_shared_data_serialization_version='advanced', object_shared_data_serialization_version_for_zero_level_parts='advanced', object_shared_data_buckets_for_compact_part=2;
insert into test_compact_without_substreams_advanced select * from source;
select json from test_compact_without_substreams_advanced;
create table test_compact_advanced (json JSON(max_dynamic_paths=8)) engine=MergeTree order by tuple() settings index_granularity=2, min_bytes_for_wide_part='200G', min_rows_for_wide_part=1, write_marks_for_substreams_in_compact_parts=1, object_serialization_version='v3', object_shared_data_serialization_version='advanced', object_shared_data_serialization_version_for_zero_level_parts='advanced', object_shared_data_buckets_for_compact_part=2;
insert into test_compact_advanced select * from source;
select json from test_compact_advanced;
select json.b from test_compact_advanced;
select json.b, json.c from test_compact_advanced;
select json.arr[].arr1 from test_compact_advanced;
select json.arr[].arr1, json.arr[].arr2 from test_compact_advanced;
select json.arr[].arr2, json.arr[].arr1 from test_compact_advanced;
select json.arr[].arr1, json.arr[].arr4 from test_compact_advanced;
select json.arr[].arr4, json.arr[].arr1 from test_compact_advanced;
select json.arr[].arr1, json.arr[].arr99 from test_compact_advanced;
select json.arr, json.arr[].arr1 from test_compact_advanced;
select json.arr[].arr1, json.arr from test_compact_advanced;
select json, json.b, json.c from test_compact_advanced;
select json.b, json.c, json from test_compact_advanced;
select json, json.b, json.c, json.arr[].arr1 from test_compact_advanced;
select json.b, json.c, json.arr[].arr1, json from test_compact_advanced;
select json, json.b, json.c, json.arr, json.arr[].arr1 from test_compact_advanced;
select json.b, json.c, json.arr[].arr1, json.arr, json from test_compact_advanced;
select json.^a from test_compact_advanced;
select json, json.^a from test_compact_advanced;
select json.^a, json.a.a1 from test_compact_advanced;
select json.a.a1, json.^a from test_compact_advanced;
select json.^a, json.a.a1, json.a.arr[].arr1 from test_compact_advanced;
select json.a.a1, json.a.arr[].arr1, json.^a from test_compact_advanced;
select json, json.a.a1, json.a.arr[].arr1, json.^a from test_compact_advanced;
select json.a.a1, json.a.arr[].arr1, json.^a, json from test_compact_advanced;
select json.^a, json.a.a1, json.a.arr[].arr1, json.b, json.arr from test_compact_advanced;
select json.a.a1, json.a.arr[].arr1, json.b, json.arr, json.^a from test_compact_advanced;
select json, json.^a, json.a.a1, json.a.arr[].arr1, json.b, json.arr from test_compact_advanced;
select json.a.a1, json.a.arr[].arr1, json.b, json.arr, json.^a, json from test_compact_advanced;
select json.arr[].arr1, json.^a, json.a.a1, json.a.arr[].arr1, json.b, json.arr from test_compact_advanced;
select json.a.a1, json.a.arr[].arr1, json.b, json.arr, json.^a, json.arr[].arr1 from test_compact_advanced;
select json, json.arr[].arr1, json.^a, json.a.a1, json.a.arr[].arr1, json.b, json.arr from test_compact_advanced;
select json.a.a1, json.a.arr[].arr1, json.b, json.arr, json.^a, json.arr[].arr1, json from test_compact_advanced;
create table test_compact_advanced_tuple (json Tuple(data JSON(max_dynamic_paths=8))) engine=MergeTree order by tuple() settings index_granularity=2, min_bytes_for_wide_part='200G', min_rows_for_wide_part=1, write_marks_for_substreams_in_compact_parts=1, object_serialization_version='v3', object_shared_data_serialization_version='advanced', object_shared_data_serialization_version_for_zero_level_parts='advanced', object_shared_data_buckets_for_compact_part=2;
insert into test_compact_advanced_tuple select tuple(json) from source;
select json.data from test_compact_advanced_tuple;
select json.data, json.data.b from test_compact_advanced_tuple;
select json.data.b, json.data from test_compact_advanced_tuple;
select json.data, json.data.b, json.data.c from test_compact_advanced_tuple;
select json.data.b, json.data, json.data.c from test_compact_advanced_tuple;
select json.data.b, json.data.c, json.data from test_compact_advanced_tuple;
select json.data, json.data.^a from test_compact_advanced_tuple;
select json.data.^a, json.data from test_compact_advanced_tuple;
select json.data, json.data.^a, json.data.b from test_compact_advanced_tuple;
select json.data.b, json.data.^a, json.data from test_compact_advanced_tuple;
