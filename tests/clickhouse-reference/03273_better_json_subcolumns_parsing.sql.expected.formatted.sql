SET enable_json_type = 1;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    json JSON
)
ENGINE = Memory;

INSERT INTO test;

SELECT
    dynamicType(json.a),
    json.a
FROM test;

SYSTEM drop  table test;