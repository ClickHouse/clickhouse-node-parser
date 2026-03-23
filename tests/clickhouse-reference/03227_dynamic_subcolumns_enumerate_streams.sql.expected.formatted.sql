SET enable_json_type = 1;

CREATE TABLE test
(
    json JSON
)
ENGINE = Memory;

INSERT INTO test SELECT toJSONString(map('a', concat('str_', number)))
FROM numbers(5);

SELECT json.a.String
FROM test;

SELECT json.a.:String
FROM test;

SELECT json.a.UInt64
FROM test;