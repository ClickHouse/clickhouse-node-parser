SELECT JSONExtract(data, 'Tuple(a FixedString(24))') AS json FROM test_fixed_string_nested_json;
