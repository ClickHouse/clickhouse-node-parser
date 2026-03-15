CREATE TABLE mt (x UInt64) ENGINE = MergeTree ORDER BY x SETTINGS parts_to_delay_insert = 100000, parts_to_throw_insert = 100000;
SET max_block_size = 1, min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0, max_execution_time = 600;
SET max_block_size = 65536;
SELECT count(), sum(x) FROM mt;
