SET allow_experimental_dynamic_type = 1;

SYSTEM DROP  TABLE IF EXISTS test_null_empty;

CREATE TABLE test_null_empty
(
    d Dynamic
)
ENGINE = Memory;

INSERT INTO test_null_empty;

SELECT
    d,
    dynamicType(d)
FROM test_null_empty;

SYSTEM DROP  TABLE test_null_empty;