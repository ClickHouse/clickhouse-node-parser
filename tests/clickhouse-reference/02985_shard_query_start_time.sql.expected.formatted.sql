CREATE TABLE sharded_table
(
    dummy UInt8
)
ENGINE = Distributed('test_cluster_two_shards', 'system', 'one');

SET prefer_localhost_replica = 0;

SELECT *
FROM sharded_table
FORMAT Null
SETTINGS log_comment = '02985_shard_query_start_time_query_1';