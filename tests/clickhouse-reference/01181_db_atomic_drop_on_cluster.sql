CREATE TABLE test_repl ON CLUSTER test_shard_localhost (n UInt64) ENGINE ReplicatedMergeTree('/clickhouse/test_01181/{database}/test_repl','r1') ORDER BY tuple();
