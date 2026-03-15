-- Tags: zookeeper
SET distributed_ddl_output_mode = 'none';
CREATE DATABASE {CLICKHOUSE_DATABASE:Identifier} ENGINE=Replicated('/clickhouse/databases/{database}', 'shard1', 'replica1');
USE {CLICKHOUSE_DATABASE:Identifier};
CREATE TABLE 03655_keepermap (k UInt64) ENGINE = KeeperMap('/' || currentDatabase() || '/03655_keepermap') PRIMARY KEY (k);
SELECT '-- Before ALTER:';
SELECT 'local:', regexpExtract(create_table_query, '(`k`.+?)(\n|\))', 1) FROM system.tables WHERE database = currentDatabase() AND table = '03655_keepermap';
SELECT 'keeper:', regexpExtract(value, '(`k`.+?)(\n|\))', 1) FROM system.zookeeper WHERE path = '/clickhouse/databases/' || currentDatabase() || '/metadata';
