CREATE TABLE index_memory (x UInt64) ENGINE = MergeTree ORDER BY x SETTINGS index_granularity = 1;
SELECT count() FROM index_memory;
SET max_memory_usage = 39000000;
