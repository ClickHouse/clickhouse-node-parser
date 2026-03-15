SET allow_experimental_dynamic_type=1;
CREATE TABLE test_null_empty (d Dynamic) ENGINE = Memory;
SELECT d, dynamicType(d) FROM test_null_empty;
