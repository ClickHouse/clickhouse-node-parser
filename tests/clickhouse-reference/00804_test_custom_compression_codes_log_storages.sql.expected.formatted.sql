SET send_logs_level = 'fatal';

SET allow_suspicious_codecs = 1;

CREATE TABLE compression_codec_log
(
    id UInt64 CODEC(LZ4),
    data String CODEC(ZSTD),
    ddd Date CODEC(NONE),
    somenum Float64 CODEC(ZSTD(2)),
    somestr FixedString(3) CODEC(LZ4HC(7)),
    othernum Int64 CODEC(Delta)
)
ENGINE = Log();

SELECT *
FROM compression_codec_log
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_log
WHERE id = 2
GROUP BY id;

CREATE TABLE compression_codec_multiple_log
(
    id UInt64 CODEC(LZ4, ZSTD, NONE, LZ4HC, Delta(4)),
    data String CODEC(ZSTD(2), NONE, Delta(2), LZ4HC, LZ4, LZ4, Delta(8)),
    ddd Date CODEC(NONE, NONE, NONE, Delta(1), LZ4, ZSTD, LZ4HC, LZ4HC),
    somenum Float64 CODEC(Delta(4), LZ4, LZ4, ZSTD(2), LZ4HC(5), ZSTD(3), ZSTD)
)
ENGINE = Log();

SELECT *
FROM compression_codec_multiple_log
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_multiple_log;

SELECT countDistinct(data)
FROM compression_codec_multiple_log;

SELECT floor(sum(somenum), 1)
FROM compression_codec_multiple_log;

SELECT sum(cityHash64(*))
FROM compression_codec_multiple_log;

CREATE TABLE compression_codec_tiny_log
(
    id UInt64 CODEC(LZ4),
    data String CODEC(ZSTD),
    ddd Date CODEC(NONE),
    somenum Float64 CODEC(ZSTD(2)),
    somestr FixedString(3) CODEC(LZ4HC(7)),
    othernum Int64 CODEC(Delta)
)
ENGINE = TinyLog();

SELECT *
FROM compression_codec_tiny_log
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_tiny_log
WHERE id = 2
GROUP BY id;

CREATE TABLE compression_codec_multiple_tiny_log
(
    id UInt64 CODEC(LZ4, ZSTD, NONE, LZ4HC, Delta(4)),
    data String CODEC(ZSTD(2), NONE, Delta(2), LZ4HC, LZ4, LZ4, Delta(8)),
    ddd Date CODEC(NONE, NONE, NONE, Delta(1), LZ4, ZSTD, LZ4HC, LZ4HC),
    somenum Float64 CODEC(Delta(4), LZ4, LZ4, ZSTD(2), LZ4HC(5), ZSTD(3), ZSTD)
)
ENGINE = TinyLog();

SELECT *
FROM compression_codec_multiple_tiny_log
ORDER BY id ASC;

SELECT count(*)
FROM compression_codec_multiple_tiny_log;

SELECT countDistinct(data)
FROM compression_codec_multiple_tiny_log;

SELECT floor(sum(somenum), 1)
FROM compression_codec_multiple_tiny_log;

SELECT sum(cityHash64(*))
FROM compression_codec_multiple_tiny_log;