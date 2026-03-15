CREATE DATABASE {CLICKHOUSE_DATABASE:Identifier} ENGINE=Replicated('/clickhouse/databases/{database}', 'shard1', 'replica1') FORMAT NULL;
USE {CLICKHOUSE_DATABASE:Identifier};
CREATE TABLE t1 (x UInt8, y String) ENGINE=ReplicatedMergeTree ORDER BY x FORMAT NULL;
