SET enable_json_type = 1;

SYSTEM drop  table if exists test;

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

SYSTEM drop  table test;