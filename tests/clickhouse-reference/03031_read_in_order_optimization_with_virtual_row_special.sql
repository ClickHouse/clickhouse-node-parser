CREATE DATABASE test_03031;
USE test_03031;
SET read_in_order_use_virtual_row = 1;
CREATE TABLE src (s String) ENGINE = MergeTree() ORDER BY s;
CREATE TABLE dist (s String) ENGINE = Distributed(test_shard_localhost, test_03031, src);
SET enable_analyzer=0;
SELECT _table FROM merge('test_03031', '') ORDER BY _table, s;
