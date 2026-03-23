-- Tags: no-fasttest
-- To make fasttest fast (this test sleeps a lot)
-- We use sleep(5) just to wait a little bit to wait some Buffer flushes, if
-- there are excessive flushes 5 seconds should be enough to catch them.
SET function_sleep_max_microseconds_per_block = 5e9;

SYSTEM drop  table if exists data;

CREATE TABLE data
(
    key Int
)
ENGINE = Null;

SYSTEM drop  table if exists empty_buffer;

CREATE TABLE empty_buffer
(
    key Int
)
ENGINE = Buffer(currentDatabase(), data, 2, 2, 4, 100000, 1000000, 10e9, 10e9, 3);

SELECT sleep(5)
FORMAT Null;

SYSTEM drop  table empty_buffer;

SYSTEM drop  table if exists empty_buffer_zero_time;

CREATE TABLE empty_buffer_zero_time
(
    key Int
)
ENGINE = Buffer(currentDatabase(), data, 2, 0, 0, 100000, 1000000, 10e9, 10e9, 0);

SELECT sleep(1)
FORMAT Null;

SYSTEM drop  table empty_buffer_zero_time;

SYSTEM drop  table if exists buffer_flush_by_min;

CREATE TABLE buffer_flush_by_min
(
    key Int
)
ENGINE = Buffer(currentDatabase(), data, 2, 2, 4, 100000, 1000000, 0, 10e9, 3);

INSERT INTO buffer_flush_by_min SELECT *
FROM numbers(100000 + 1);

SYSTEM drop  table buffer_flush_by_min;

SYSTEM drop  table if exists buffer_flush_by_max;

CREATE TABLE buffer_flush_by_max
(
    key Int
)
ENGINE = Buffer(currentDatabase(), data, 2, 2, 4, 100000, 1000000, 0, 10e9);

INSERT INTO buffer_flush_by_max SELECT *
FROM numbers(1);

SYSTEM drop  table buffer_flush_by_max;

SYSTEM drop  table if exists buffer_flush_by_flush_time;

CREATE TABLE buffer_flush_by_flush_time
(
    key Int
)
ENGINE = Buffer(currentDatabase(), data, 2, 2, 4, 100000, 1000000, 10e9, 10e9, 3);

INSERT INTO buffer_flush_by_flush_time;

SYSTEM drop  table buffer_flush_by_flush_time;

-- to avoid flakiness we only check that number of logs < 20, instead of some strict values
SELECT
    extractAll(logger_name, 'StorageBuffer \\([^.]+\\.([^)]+)\\)')[1] AS table_name,
    max2(count(), 20)
FROM `system`.text_log
WHERE like(logger_name, format('%StorageBuffer ({}.%', currentDatabase()))
GROUP BY 1
ORDER BY 1 ASC;