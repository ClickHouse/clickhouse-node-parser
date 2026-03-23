-- Tags: log-engine
DROP TABLE IF EXISTS mergeTree_02184;
CREATE TABLE mergeTree_02184 (id UInt64, name String, dt Date) Engine=MergeTree ORDER BY id;
ALTER TABLE mergeTree_02184 MODIFY COLUMN name String TTL dt + INTERVAL 1 MONTH;
DROP TABLE IF EXISTS distributed_02184;
CREATE TABLE distributed_02184 (id UInt64, name String, dt Date) Engine=Distributed('test_cluster_two_shards', 'default', 'mergeTree_02184', rand());
ALTER TABLE distributed_02184 MODIFY COLUMN name String TTL dt + INTERVAL 1 MONTH; -- { serverError BAD_ARGUMENTS }
DROP TABLE IF EXISTS buffer_02184;
CREATE TABLE buffer_02184 (id UInt64, name String, dt Date) ENGINE = Buffer(default, mergeTree_02184, 16, 10, 100, 10000, 1000000, 10000000, 100000000);
ALTER TABLE buffer_02184 MODIFY COLUMN name String TTL dt + INTERVAL 1 MONTH; -- { serverError BAD_ARGUMENTS }
DROP TABLE IF EXISTS merge_02184;
CREATE TABLE merge_02184 (id UInt64, name String, dt Date) ENGINE = Merge('default', 'distributed_02184');
ALTER TABLE merge_02184 MODIFY COLUMN name String TTL dt + INTERVAL 1 MONTH; -- { serverError BAD_ARGUMENTS }
DROP TABLE IF EXISTS null_02184;
CREATE TABLE null_02184 AS system.one Engine=Null();
ALTER TABLE null_02184 MODIFY COLUMN dummy Int TTL now() + INTERVAL 1 MONTH; -- { serverError BAD_ARGUMENTS }
DROP TABLE IF EXISTS file_02184;
CREATE TABLE file_02184 (id UInt64, name String, dt Date) ENGINE = File(TabSeparated);
ALTER TABLE file_02184 MODIFY COLUMN name String TTL dt + INTERVAL 1 MONTH; -- { serverError BAD_ARGUMENTS }
DROP TABLE IF EXISTS memory_02184;
CREATE TABLE memory_02184 (id UInt64, name String, dt Date) ENGINE = Memory();
ALTER TABLE memory_02184 MODIFY COLUMN name String TTL dt + INTERVAL 1 MONTH; -- { serverError BAD_ARGUMENTS }
DROP TABLE IF EXISTS log_02184;
CREATE TABLE log_02184 (id UInt64, name String, dt Date) ENGINE = Log();
ALTER TABLE log_02184 MODIFY COLUMN name String TTL dt + INTERVAL 1 MONTH; -- { serverError BAD_ARGUMENTS }
DROP TABLE IF EXISTS ting_log_02184;
CREATE TABLE ting_log_02184 (id UInt64, name String, dt Date) ENGINE = TinyLog();
ALTER TABLE ting_log_02184 MODIFY COLUMN name String TTL dt + INTERVAL 1 MONTH; -- { serverError BAD_ARGUMENTS }
DROP TABLE IF EXISTS stripe_log_02184;
CREATE TABLE stripe_log_02184 (id UInt64, name String, dt Date) ENGINE = StripeLog;
ALTER TABLE stripe_log_02184 MODIFY COLUMN name String TTL dt + INTERVAL 1 MONTH; -- { serverError BAD_ARGUMENTS }
