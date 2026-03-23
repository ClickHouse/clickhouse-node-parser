DROP TABLE IF EXISTS compression_codec_on_alias;
CREATE TABLE compression_codec_on_alias (
    `c0` ALIAS c1 CODEC(ZSTD),
    c1 UInt64
) ENGINE = MergeTree() PARTITION BY c0 ORDER BY c1; -- { serverError BAD_ARGUMENTS }
CREATE TABLE compression_codec_on_alias (
    c0 UInt64 CODEC(ZSTD),
    c1 UInt64
) ENGINE = MergeTree() PARTITION BY c0 ORDER BY c1; -- success
