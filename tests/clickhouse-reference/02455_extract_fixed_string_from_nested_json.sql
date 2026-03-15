CREATE TABLE test_fixed_string_nested_json (data String) ENGINE MergeTree ORDER BY data;
SELECT JSONExtract(data, 'Tuple(a FixedString(24))') AS json FROM test_fixed_string_nested_json;
