-- Tags: long, no-object-storage
-- no-object-storage: Avoid flakiness due to cache / buffer usage
SET insert_keeper_fault_injection_probability = 0; -- to succeed this test can require too many retries due to 100 partitions, so disable fault injections

CREATE TABLE data_02228
(
    key1 UInt32,
    sign Int8,
    s UInt64
)
ENGINE = CollapsingMergeTree(sign)
ORDER BY key1
PARTITION BY key1 % 100
SETTINGS auto_statistics_types = '';

CREATE TABLE data_rep_02228
(
    key1 UInt32,
    sign Int8,
    s UInt64
)
ENGINE = ReplicatedCollapsingMergeTree('/clickhouse/{database}', 'r1', sign)
ORDER BY key1
PARTITION BY key1 % 100
SETTINGS auto_statistics_types = '';