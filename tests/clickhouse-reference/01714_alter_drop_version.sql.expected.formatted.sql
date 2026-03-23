CREATE TABLE alter_drop_version
(
    key UInt64,
    value String,
    ver Int8
)
ENGINE = ReplacingMergeTree(ver)
ORDER BY key;

INSERT INTO alter_drop_version;

SELECT *
FROM alter_drop_version;