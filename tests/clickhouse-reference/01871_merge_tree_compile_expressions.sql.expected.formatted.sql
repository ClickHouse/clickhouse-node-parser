-- Tags: no-azure-blob-storage
SYSTEM DROP  TABLE IF EXISTS data_01875_1;

SYSTEM DROP  TABLE IF EXISTS data_01875_2;

SYSTEM DROP  TABLE IF EXISTS data_01875_3;

SET compile_expressions = true;

-- CREATE TABLE will use global profile with default min_count_to_compile_expression=3
-- so retry 3 times
CREATE TABLE data_01875_1
ENGINE = MergeTree
ORDER BY number
PARTITION BY bitShiftRight(number, 8) + 1 AS
SELECT *
FROM numbers(16384);

CREATE TABLE data_01875_2
ENGINE = MergeTree
ORDER BY number
PARTITION BY bitShiftRight(number, 8) + 1 AS
SELECT *
FROM numbers(16384);

CREATE TABLE data_01875_3
ENGINE = MergeTree
ORDER BY number
PARTITION BY bitShiftRight(number, 8) + 1 AS
SELECT *
FROM numbers(16384);

SELECT number
FROM data_01875_3
WHERE number = 999;

SYSTEM DROP  TABLE data_01875_1;

SYSTEM DROP  TABLE data_01875_2;

SYSTEM DROP  TABLE data_01875_3;