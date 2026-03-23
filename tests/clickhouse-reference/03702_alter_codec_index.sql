CREATE TABLE test_alter_codec_index (`id` UInt64, value UInt64, INDEX id_index id TYPE minmax GRANULARITY 1) Engine=MergeTree() ORDER BY tuple();
INSERT INTO test_alter_codec_index SELECT number, number * number from numbers(100);
SELECT sum(id) FROM test_alter_codec_index;
INSERT INTO test_alter_codec_index (value) VALUES (1);
