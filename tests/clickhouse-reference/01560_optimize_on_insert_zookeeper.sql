CREATE TABLE empty1 (key UInt32, val UInt32, date Datetime)
ENGINE=ReplicatedSummingMergeTree('/clickhouse/tables/{database}/test_01560_optimize_on_insert', '1', val)
PARTITION BY date ORDER BY key;
CREATE TABLE empty2 (key UInt32, val UInt32, date Datetime)
ENGINE=ReplicatedSummingMergeTree('/clickhouse/tables/{database}/test_01560_optimize_on_insert', '2', val)
PARTITION BY date ORDER BY key;
SELECT * FROM empty1 ORDER BY key;
SELECT * FROM empty2 ORDER BY key;
SELECT table, partition, active FROM system.parts where table = 'empty1' and database=currentDatabase() and active = 1;
SELECT table, partition, active FROM system.parts where table = 'empty2' and database=currentDatabase() and active = 1;
