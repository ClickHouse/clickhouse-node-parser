CREATE TABLE table_rename_with_default
(
    date Date,
    key UInt64,
    value1 String,
    value2 String DEFAULT concat('Hello ', value1),
    value3 String ALIAS concat('Word ', value1)
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY date;

SELECT *
FROM table_rename_with_default
WHERE key = 1
FORMAT TSVWithNames;

SELECT value2
FROM table_rename_with_default
WHERE key = 1;

SELECT value3
FROM table_rename_with_default
WHERE key = 1;

CREATE TABLE table_rename_with_ttl
(
    date1 Date,
    date2 Date,
    value1 String,
    value2 String TTL date1 + toIntervalMonth(500)
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01213/table_rename_with_ttl', '1')
ORDER BY tuple()
TTL date2 + toIntervalMonth(500);

SELECT *
FROM table_rename_with_ttl
WHERE value1 = '1'
FORMAT TSVWithNames;