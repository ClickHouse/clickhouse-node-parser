CREATE TABLE table_for_rename_pk
(
    date Date,
    key1 UInt64,
    key2 UInt64,
    key3 UInt64,
    value1 String,
    value2 String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01213/table_for_rename_pk1', '1')
ORDER BY (key1, pow(key2, 2), key3)
PARTITION BY date;

SELECT
    key1,
    value1
FROM table_for_rename_pk
WHERE key1 = 1
    AND key2 = 1
    AND key3 = 1;

CREATE TABLE table_for_rename_with_primary_key
(
    date Date,
    key1 UInt64,
    key2 UInt64,
    key3 UInt64,
    value1 String,
    value2 String,
    INDEX idx value1 TYPE set(1) GRANULARITY 1
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01213/table_for_rename_pk2', '1')
ORDER BY (key1, key2, key3)
PRIMARY KEY (key1, key2)
PARTITION BY date;