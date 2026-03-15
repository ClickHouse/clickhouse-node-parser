-- Tags: memory-engine
SET max_block_size = 65409; -- Default value
CREATE TABLE memory (i UInt32) ENGINE = Memory SETTINGS min_bytes_to_keep = 8192, max_bytes_to_keep = 32768;
SELECT total_bytes FROM system.tables WHERE name = 'memory' and database = currentDatabase(); -- 17408 in total
CREATE TABLE memory (i UInt32) ENGINE = Memory SETTINGS min_rows_to_keep = 200, max_rows_to_keep = 2000;
SELECT total_rows FROM system.tables WHERE name = 'memory' and database = currentDatabase(); -- 1100 in total
CREATE TABLE memory (i UInt32) ENGINE = Memory;
