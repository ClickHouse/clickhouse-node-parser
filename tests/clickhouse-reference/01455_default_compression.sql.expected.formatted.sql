CREATE TABLE compress_table
(
    key UInt64,
    value1 String CODEC(Default),
    value2 UInt64 CODEC(Delta, Default),
    value3 String CODEC(ZSTD(10))
)
ENGINE = MergeTree()
ORDER BY key;

SELECT *
FROM compress_table;

SELECT *
FROM compress_table
ORDER BY key ASC;