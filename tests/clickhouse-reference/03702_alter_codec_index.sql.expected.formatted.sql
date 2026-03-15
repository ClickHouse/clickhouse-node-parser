CREATE TABLE test_alter_codec_index
(
    id UInt64,
    value UInt64,
    INDEX id_index id TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT sum(id)
FROM test_alter_codec_index;