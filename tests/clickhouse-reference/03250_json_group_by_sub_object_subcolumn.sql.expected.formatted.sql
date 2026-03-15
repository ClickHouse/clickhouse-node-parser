SET enable_json_type = 1;

SET allow_experimental_variant_type = 1;

SET use_variant_as_common_type = 1;

CREATE TABLE test
(
    json JSON(max_dynamic_paths = 20, `a.b.c` UInt32)
)
ENGINE = Memory;

SELECT json.`^a`
FROM test
GROUP BY json.`^a`
ORDER BY toString(json.`^a`) ASC;