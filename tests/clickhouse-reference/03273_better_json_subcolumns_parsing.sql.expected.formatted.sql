SET enable_json_type = 1;

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