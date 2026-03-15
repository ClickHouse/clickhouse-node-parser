SET enable_json_type = 1;

CREATE TABLE test
(
    json JSON
)
ENGINE = Memory;

SELECT json.a.String
FROM test;

SELECT json.a.:String
FROM test;

SELECT json.a.UInt64
FROM test;