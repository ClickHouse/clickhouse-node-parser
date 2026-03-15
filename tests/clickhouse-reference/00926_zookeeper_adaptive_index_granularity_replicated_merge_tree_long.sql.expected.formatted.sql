-- Tags: long, replica, no-random-merge-tree-settings
----- Group of very similar simple tests ------
SELECT '----HORIZONTAL MERGE TESTS----';

CREATE TABLE zero_rows_per_granule1
(
    p Date,
    k UInt64,
    v1 UInt64,
    v2 Int64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/zero_rows_in_granule', '1')
ORDER BY k
PARTITION BY toYYYYMM(p)
SETTINGS index_granularity_bytes = 20, min_index_granularity_bytes = 10, write_final_mark = 0;

CREATE TABLE zero_rows_per_granule2
(
    p Date,
    k UInt64,
    v1 UInt64,
    v2 Int64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/zero_rows_in_granule', '2')
ORDER BY k
PARTITION BY toYYYYMM(p)
SETTINGS index_granularity_bytes = 20, min_index_granularity_bytes = 10, write_final_mark = 0;

SELECT COUNT(*)
FROM zero_rows_per_granule1;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'zero_rows_per_granule1'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM zero_rows_per_granule2;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'zero_rows_per_granule2'
    AND database = currentDatabase()
    AND active = 1;

SELECT sleep(0.7)
FORMAT Null;

CREATE TABLE four_rows_per_granule1
(
    p Date,
    k UInt64,
    v1 UInt64,
    v2 Int64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/four_rows_in_granule', '1')
ORDER BY k
PARTITION BY toYYYYMM(p)
SETTINGS index_granularity_bytes = 110, min_index_granularity_bytes = 100, write_final_mark = 0;

CREATE TABLE four_rows_per_granule2
(
    p Date,
    k UInt64,
    v1 UInt64,
    v2 Int64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/four_rows_in_granule', '2')
ORDER BY k
PARTITION BY toYYYYMM(p)
SETTINGS index_granularity_bytes = 110, min_index_granularity_bytes = 100, write_final_mark = 0;

SELECT COUNT(*)
FROM four_rows_per_granule1;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'four_rows_per_granule1'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM four_rows_per_granule2;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'four_rows_per_granule2'
    AND database = currentDatabase()
    AND active = 1;

CREATE TABLE adaptive_granularity_alter1
(
    p Date,
    k UInt64,
    v1 UInt64,
    v2 Int64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/adaptive_granularity_alter', '1')
ORDER BY k
PARTITION BY toYYYYMM(p)
SETTINGS index_granularity_bytes = 110, min_index_granularity_bytes = 100, write_final_mark = 0;

CREATE TABLE adaptive_granularity_alter2
(
    p Date,
    k UInt64,
    v1 UInt64,
    v2 Int64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/adaptive_granularity_alter', '2')
ORDER BY k
PARTITION BY toYYYYMM(p)
SETTINGS index_granularity_bytes = 110, min_index_granularity_bytes = 100, write_final_mark = 0;

SELECT COUNT(*)
FROM adaptive_granularity_alter1;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'adaptive_granularity_alter1'
    AND database = currentDatabase()
    AND active = 1;

SELECT COUNT(*)
FROM adaptive_granularity_alter2;

SELECT DISTINCT (marks)
FROM `system`.parts
WHERE table = 'adaptive_granularity_alter2'
    AND database = currentDatabase()
    AND active = 1;

SELECT
    k,
    v2
FROM adaptive_granularity_alter1
WHERE k >= 100
    OR k = 42
ORDER BY k ASC;

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'adaptive_granularity_alter1'
    AND database = currentDatabase()
    AND active = 1;

SELECT
    k,
    v2
FROM adaptive_granularity_alter2
WHERE k >= 100
    OR k = 42
ORDER BY k ASC;

SELECT sum(marks)
FROM `system`.parts
WHERE table = 'adaptive_granularity_alter2'
    AND database = currentDatabase()
    AND active = 1;