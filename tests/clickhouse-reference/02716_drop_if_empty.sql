CREATE TABLE data_02716_1 (v UInt64) ENGINE = MergeTree ORDER BY v;
CREATE TABLE data_02716_2 (v UInt64) ENGINE = MergeTree ORDER BY v;
CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier};
CREATE TABLE {CLICKHOUSE_DATABASE_1:Identifier}.data_02716_3 (v UInt64) ENGINE = MergeTree ORDER BY v;
SELECT count() FROM system.tables WHERE database = {CLICKHOUSE_DATABASE_1:String};
SELECT count() FROM system.tables WHERE database = 'default' AND name IN ('data_02716_1', 'data_02716_2');
