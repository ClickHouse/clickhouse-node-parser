SET enable_json_type = 1;

SYSTEM DROP  TABLE IF EXISTS test_new_json_type;

CREATE TABLE test_new_json_type
(
    id UInt32,
    data JSON,
    version UInt64
)
ENGINE = ReplacingMergeTree(version)
ORDER BY id;

INSERT INTO test_new_json_type;

SELECT *
FROM test_new_json_type FINAL
WHERE isNotNull(data.foo2)
ORDER BY id ASC;

INSERT INTO test_new_json_type SELECT
    id,
    '{"foo2":"baz"}' AS _data,
    version + 1 AS _version
FROM test_new_json_type
WHERE id = 2;

SYSTEM DROP  TABLE test_new_json_type;

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