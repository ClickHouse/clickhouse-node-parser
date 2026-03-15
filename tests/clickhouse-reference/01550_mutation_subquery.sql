CREATE TABLE t(`id` String, `dealer_id` String) ENGINE = MergeTree() ORDER BY id SETTINGS index_granularity = 8192;
SELECT * FROM t;
SET mutations_sync = 1;
SELECT '---';
