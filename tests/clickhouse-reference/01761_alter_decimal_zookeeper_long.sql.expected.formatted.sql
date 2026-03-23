-- Tags: long, zookeeper
DROP TABLE IF EXISTS test_alter_decimal;

CREATE TABLE test_alter_decimal
(
    n UInt64,
    d Decimal(15, 8)
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/01761_alter_decimal_zookeeper', 'r1')
ORDER BY tuple();

INSERT INTO test_alter_decimal;

INSERT INTO test_alter_decimal;

SELECT *
FROM test_alter_decimal
ORDER BY n ASC;

INSERT INTO test_alter_decimal;