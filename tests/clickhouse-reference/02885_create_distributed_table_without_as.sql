CREATE TABLE local_tbl (`key` UInt32, `value` UInt32 DEFAULT 42) ENGINE = MergeTree ORDER BY key;
CREATE TABLE dist_tbl ENGINE = Distributed('test_shard_localhost', currentDatabase(), 'local_tbl', rand());
SELECT * FROM local_tbl;
SELECT * FROM dist_tbl;
