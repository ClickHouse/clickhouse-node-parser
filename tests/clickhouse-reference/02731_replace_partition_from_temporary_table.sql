CREATE TEMPORARY TABLE src (p UInt64, k String, d UInt64) ENGINE = MergeTree PARTITION BY p ORDER BY k;
CREATE TABLE dst (p UInt64, k String, d UInt64) ENGINE = MergeTree PARTITION BY p ORDER BY k;
CREATE TABLE rdst (p UInt64, k String, d UInt64) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_alter_attach_00626_rdst', 'r1') PARTITION BY p ORDER BY k;
SELECT count(), sum(d) FROM dst;
SELECT count(), sum(d) FROM rdst;
