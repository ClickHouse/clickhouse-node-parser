SELECT * FROM test_deep_nested_json ORDER BY i;
SELECT d::Dynamic d1, dynamicType(d1) FROM test_deep_nested_json ORDER BY i;
