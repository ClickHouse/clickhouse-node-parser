-- Tags: no-msan
-- (because the INSERT with 300k rows sometimes takes >5 minutes in msan build, I didn't investigate why)
SET send_logs_level = 'fatal';

CREATE TABLE alter_compression_codec
(
    somedate Date CODEC(LZ4),
    id UInt64 CODEC(NONE)
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY somedate;

INSERT INTO alter_compression_codec;

INSERT INTO alter_compression_codec;

SELECT *
FROM alter_compression_codec
ORDER BY id ASC;

SELECT compression_codec
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'alter_compression_codec'
    AND name = 'alter_column';

INSERT INTO alter_compression_codec;

INSERT INTO alter_compression_codec;

INSERT INTO alter_compression_codec;

INSERT INTO alter_compression_codec;

SET allow_suspicious_codecs = 1;

INSERT INTO alter_compression_codec;

INSERT INTO alter_compression_codec;

CREATE TABLE alter_bad_codec
(
    somedate Date CODEC(LZ4),
    id UInt64 CODEC(NONE)
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE large_alter_table_00804
(
    somedate Date CODEC(ZSTD, ZSTD, ZSTD(12), LZ4HC(12)),
    id UInt64 CODEC(LZ4, ZSTD, NONE, LZ4HC),
    data String CODEC(ZSTD(2), LZ4HC, NONE, LZ4, LZ4)
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY somedate
SETTINGS index_granularity = 2, index_granularity_bytes = '10Mi', min_bytes_for_wide_part = 0;

SET max_execution_time = 300;

INSERT INTO large_alter_table_00804 SELECT
    toDate('2019-01-01'),
    number,
    toString(number + rand())
FROM `system`.numbers
LIMIT 300000;

CREATE TABLE store_of_hash_00804
(
    hash UInt64
)
ENGINE = Memory();

INSERT INTO store_of_hash_00804 SELECT sum(cityHash64(*))
FROM large_alter_table_00804;

SELECT compression_codec
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'large_alter_table_00804'
    AND name = 'data';

SELECT COUNT(hash)
FROM store_of_hash_00804;

SELECT COUNTDistinct(hash)
FROM store_of_hash_00804;