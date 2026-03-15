CREATE TABLE test_alter_codec_pk
(
    id UInt64,
    value UInt64
)
ENGINE = MergeTree()
ORDER BY id;

SELECT sum(id)
FROM test_alter_codec_pk;