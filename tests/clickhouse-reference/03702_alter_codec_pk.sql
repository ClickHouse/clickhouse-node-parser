CREATE TABLE test_alter_codec_pk (id UInt64, value UInt64) Engine=MergeTree() ORDER BY id;
INSERT INTO test_alter_codec_pk SELECT number, number * number from numbers(100);
SELECT sum(id) FROM test_alter_codec_pk;
INSERT INTO test_alter_codec_pk (value) VALUES (1);
