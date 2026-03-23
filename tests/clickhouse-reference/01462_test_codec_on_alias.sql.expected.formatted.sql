SYSTEM DROP  TABLE IF EXISTS compression_codec_on_alias;

CREATE TABLE compression_codec_on_alias
(
    c0 ALIAS c1 CODEC(ZSTD),
    c1 UInt64
)
ENGINE = MergeTree()
ORDER BY c1
PARTITION BY c0; -- { serverError BAD_ARGUMENTS }

CREATE TABLE compression_codec_on_alias
(
    c0 UInt64 CODEC(ZSTD),
    c1 UInt64
)
ENGINE = MergeTree()
ORDER BY c1
PARTITION BY c0; -- success