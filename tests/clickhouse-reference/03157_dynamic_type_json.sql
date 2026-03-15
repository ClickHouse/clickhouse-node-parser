SET allow_experimental_dynamic_type=1;
SET enable_json_type=1;
SET allow_experimental_variant_type=1;
CREATE TABLE test_deep_nested_json (i UInt16, d JSON) ENGINE = Memory;
SELECT * FROM test_deep_nested_json ORDER BY i;
SELECT d::Dynamic d1, dynamicType(d1) FROM test_deep_nested_json ORDER BY i;
