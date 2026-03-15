CREATE TABLE test_alter_decimal
(
    n UInt64,
    d Decimal(15, 8)
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/01761_alter_decimal_zookeeper', 'r1')
ORDER BY tuple();

SELECT *
FROM test_alter_decimal
ORDER BY n ASC;