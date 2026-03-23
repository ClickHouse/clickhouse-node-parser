-- Tags: zookeeper
SET insert_keeper_fault_injection_probability = 0; -- disable fault injection; part ids are non-deterministic in case of insert retries

SET send_logs_level = 'error';

CREATE TABLE mt
(
    n UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY n
PARTITION BY intDiv(n, 10);

INSERT INTO mt;

CREATE TABLE rmt
(
    n UInt64,
    s String
)
ENGINE = ReplicatedMergeTree('/clickhouse/test_01149_{database}/rmt', 'r1')
ORDER BY n
PARTITION BY intDiv(n, 10);

INSERT INTO rmt;

SELECT *
FROM rmt;

SELECT *
FROM mt;

SELECT
    table,
    partition_id,
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table IN ('mt', 'rmt')
    AND active = 1
ORDER BY
    table ASC,
    name ASC;

SET mutations_sync = 1;

SELECT
    mutation_id,
    command,
    parts_to_do_names,
    parts_to_do,
    is_done
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'rmt';

SET replication_alter_partitions_sync = 0;

INSERT INTO rmt;

SET replication_alter_partitions_sync = 1;