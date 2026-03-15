CREATE TABLE simple (d Int8) ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_00563/tables/simple', '1') ORDER BY d;
SELECT * FROM remote('127.0.0.1', currentDatabase(), 'simple') ORDER BY d;
SELECT * FROM remote('127.0.0.2', currentDatabase(), 'simple') ORDER BY d;
