-- This test produces warning
SET send_logs_level = 'error';
SET prefer_localhost_replica=0;
CREATE TABLE tmp_02482 (i UInt64, n LowCardinality(String)) ENGINE = Memory;
CREATE TABLE dist_02482(i UInt64, n LowCardinality(Nullable(String))) ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), tmp_02482, i);
SET distributed_foreground_insert=1;
SET distributed_foreground_insert=0;
