SET allow_experimental_dynamic_type = 1;

CREATE TABLE qbit_dynamic_test
(
    id UInt32,
    data Dynamic
)
ENGINE = Memory;

INSERT INTO qbit_dynamic_test;

SELECT
    id,
    data,
    dynamicType(data) AS type
FROM qbit_dynamic_test
ORDER BY id ASC;

INSERT INTO qbit_dynamic_test;