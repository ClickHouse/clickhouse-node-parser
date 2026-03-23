SYSTEM DROP  TABLE IF EXISTS test_alter_codec_pk;

CREATE TABLE test_alter_codec_pk
(
    id UInt64,
    value UInt64
)
ENGINE = MergeTree()
ORDER BY id;

INSERT INTO test_alter_codec_pk SELECT
    number,
    number * number
FROM numbers(100);

SELECT sum(id)
FROM test_alter_codec_pk;

INSERT INTO test_alter_codec_pk (value);