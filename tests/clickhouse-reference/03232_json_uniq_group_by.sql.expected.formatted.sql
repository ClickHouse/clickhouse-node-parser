SET enable_json_type = 1;

CREATE TABLE test
(
    json JSON(a UInt32, max_dynamic_paths=2)
)
ENGINE = Memory;

SELECT uniqExact(json)
FROM test;

SELECT
    count(),
    json
FROM test
GROUP BY json
ORDER BY toString(json) ASC;