-- Tags: distributed

set distributed_foreground_insert=1;
-- To suppress "Structure does not match (...), implicit conversion will be done." message
SET send_logs_level='error';
CREATE TABLE dist_00967 (key UInt64) Engine=Distributed('test_shard_localhost', currentDatabase(), underlying_00967);
CREATE TABLE underlying_00967 (key Nullable(UInt64)) Engine=TinyLog();
SELECT * FROM dist_00967;
