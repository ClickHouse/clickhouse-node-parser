SET allow_experimental_dynamic_type = 1;

CREATE TABLE test
(
    d Dynamic
)
ENGINE = Memory;

SELECT d.UInt64
FROM test
SETTINGS enable_analyzer = 1;

SELECT d.UInt64
FROM test
SETTINGS enable_analyzer = 0;