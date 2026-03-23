-- Tags: long, replica
SET insert_keeper_fault_injection_probability = 0; -- disable fault injection; part ids are non-deterministic in case of insert retries

SET replication_alter_partitions_sync = 2;

CREATE TABLE test
(
    x Enum('hello' = 1, 'world' = 2),
    y String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01346/table', 'r1')
ORDER BY y
PARTITION BY x;

CREATE TABLE test2
(
    x Enum('hello' = 1, 'world' = 2),
    y String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01346/table', 'r2')
ORDER BY y
PARTITION BY x;

INSERT INTO test;

SELECT *
FROM test;

SELECT *
FROM test2;

SELECT
    min_block_number,
    max_block_number,
    `partition`,
    partition_id
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test'
    AND active
ORDER BY `partition` ASC;

SELECT
    min_block_number,
    max_block_number,
    `partition`,
    partition_id
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test2'
    AND active
ORDER BY `partition` ASC;

INSERT INTO test;

SELECT *
FROM test
ORDER BY x ASC;

SELECT *
FROM test2
ORDER BY x ASC;

INSERT INTO test;