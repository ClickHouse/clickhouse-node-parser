-- Tags: no-async-insert

SET wait_for_async_insert = 0;
SET async_insert_busy_timeout_max_ms = 300000;
SET async_insert_busy_timeout_min_ms = 300000;
SET async_insert_use_adaptive_busy_timeout = 0;
CREATE TABLE t_async_insert_alter (id Int64, v1 Int64) ENGINE = MergeTree ORDER BY id SETTINGS async_insert = 1;
-- ADD COLUMN

INSERT INTO t_async_insert_alter VALUES (42, 24);
SELECT * FROM t_async_insert_alter ORDER BY id;
-- MODIFY COLUMN

INSERT INTO t_async_insert_alter VALUES (43, 34, 55);
-- DROP COLUMN

INSERT INTO t_async_insert_alter VALUES ('100', '200', '300');
SELECT query, data_kind, status FROM system.asynchronous_insert_log WHERE database = currentDatabase() AND table = 't_async_insert_alter' ORDER BY event_time_microseconds;
