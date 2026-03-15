CREATE TABLE data_00612 (key UInt64, val UInt64) ENGINE = MergeTree ORDER BY key;
CREATE TABLE dist_00612 AS data_00612 ENGINE = Distributed(test_shard_localhost, currentDatabase(), data_00612, rand());
SET distributed_foreground_insert=1;
SET prefer_localhost_replica=0;
SET max_query_size=29;
SELECT key FROM dist_00612;
SET max_query_size=262144;
SET distributed_foreground_insert=0;
SET prefer_localhost_replica=1;
