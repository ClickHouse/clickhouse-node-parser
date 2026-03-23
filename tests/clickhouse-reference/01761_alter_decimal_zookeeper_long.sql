CREATE TABLE test_alter_decimal
(n UInt64, d Decimal(15, 8))
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/01761_alter_decimal_zookeeper', 'r1')
ORDER BY tuple();
INSERT INTO test_alter_decimal VALUES (1, toDecimal32(5, 5));
INSERT INTO test_alter_decimal VALUES (2, toDecimal32(6, 6));
SELECT * FROM test_alter_decimal ORDER BY n;
INSERT INTO test_alter_decimal VALUES (3, toDecimal32(7, 7));
