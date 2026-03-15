CREATE TABLE t_read_in_order_2 (id UInt64, v UInt64) ENGINE = MergeTree ORDER BY id;
SET optimize_read_in_order = 1;
SET max_threads = 4;
SET read_in_order_use_buffering = 1;
SET max_memory_usage = '100M';
SELECT * FROM t_read_in_order_2 ORDER BY id FORMAT Null;
