-- Tags: memory-engine
SET max_block_size = 65409; -- Default value

CREATE TABLE memory
(
    i UInt32
)
ENGINE = Memory
SETTINGS min_bytes_to_keep = 4096, max_bytes_to_keep = 16384;

SELECT total_bytes
FROM `system`.tables
WHERE name = 'memory'
    AND database = currentDatabase();

CREATE TABLE memory
(
    i UInt32
)
ENGINE = Memory
SETTINGS min_rows_to_keep = 100, max_rows_to_keep = 1000;

SELECT total_rows
FROM `system`.tables
WHERE name = 'memory'
    AND database = currentDatabase();

CREATE TABLE memory
(
    i UInt32
)
ENGINE = Memory;

CREATE TABLE faulty_memory
(
    i UInt32
)
ENGINE = Memory
SETTINGS min_rows_to_keep = 100; -- { serverError SETTING_CONSTRAINT_VIOLATION }

CREATE TABLE faulty_memory
(
    i UInt32
)
ENGINE = Memory
SETTINGS min_bytes_to_keep = 100; -- { serverError SETTING_CONSTRAINT_VIOLATION }