SET allow_experimental_dynamic_type = 1;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    d Dynamic
)
ENGINE = Memory;

INSERT INTO test SELECT *
FROM numbers(5);

SELECT d.UInt64
FROM test
SETTINGS enable_analyzer = 1;

SELECT d.UInt64
FROM test
SETTINGS enable_analyzer = 0;

SYSTEM drop  table test;