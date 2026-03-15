CREATE TABLE table_with_version
(
    key UInt64,
    value String,
    version UInt8,
    sign Int8
)
ENGINE = VersionedCollapsingMergeTree(sign, version)
ORDER BY key;

SELECT *
FROM table_with_version
ORDER BY key ASC;

SELECT *
FROM table_with_version FINAL
ORDER BY key ASC;