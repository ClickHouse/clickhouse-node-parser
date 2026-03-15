CREATE TABLE test_vertical_json
(
    id UInt32,
    data JSON,
    nullableData Nullable(JSON)
)
ENGINE = Memory;

SELECT *
FROM test_vertical_json
ORDER BY id ASC
FORMAT Vertical;