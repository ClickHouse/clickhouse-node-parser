SET allow_experimental_dynamic_type = 1;
CREATE TABLE qbit_dynamic_test (id UInt32, data Dynamic) ENGINE = Memory;
SELECT id, data, dynamicType(data) as type FROM qbit_dynamic_test ORDER BY id;
