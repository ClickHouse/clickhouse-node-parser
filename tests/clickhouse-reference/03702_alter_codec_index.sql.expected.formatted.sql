DROP TABLE IF EXISTS test_alter_codec_index;

CREATE TABLE test_alter_codec_index
(
    id UInt64,
    value UInt64,
    INDEX id_index id TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO test_alter_codec_index SELECT
    number,
    number * number
FROM numbers(100);

SELECT sum(id)
FROM test_alter_codec_index;

INSERT INTO test_alter_codec_index (value);