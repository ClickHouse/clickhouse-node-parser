SET enable_json_type = 1;

CREATE TABLE test_new_json_type
(
    id UInt32,
    data JSON,
    version UInt64
)
ENGINE = ReplacingMergeTree(version)
ORDER BY id;

SELECT *
FROM test_new_json_type FINAL
WHERE isNotNull(data.foo2)
ORDER BY id ASC;

CREATE TABLE test_new_json_type
(
    id Nullable(UInt32),
    data JSON,
    version UInt64
)
ENGINE = ReplacingMergeTree(version)
ORDER BY id
SETTINGS allow_nullable_key = 1;

SELECT *
FROM test_new_json_type FINAL
PREWHERE isNotNull(data.foo2)
WHERE isNotNull(data.foo2)
ORDER BY id ASC;