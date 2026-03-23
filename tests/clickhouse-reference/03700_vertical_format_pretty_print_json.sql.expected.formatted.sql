-- Tags: no-fasttest
SYSTEM DROP  TABLE IF EXISTS test_vertical_json;

CREATE TABLE test_vertical_json
(
    id UInt32,
    data JSON,
    nullableData Nullable(JSON)
)
ENGINE = Memory;

INSERT INTO test_vertical_json;

INSERT INTO test_vertical_json;

SELECT *
FROM test_vertical_json
ORDER BY id ASC
FORMAT Vertical;

SYSTEM DROP  TABLE test_vertical_json;