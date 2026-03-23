-- Tags: long, zookeeper
SYSTEM DROP  TABLE IF EXISTS report;

CREATE TABLE report
(
    product Enum8('IU' = 1, 'WS' = 2),
    machine String,
    branch String,
    generated_time DateTime
)
ENGINE = MergeTree
ORDER BY (product, machine, branch, generated_time)
PARTITION BY (product, toYYYYMM(generated_time));

INSERT INTO report;

SELECT *
FROM report
WHERE product = 'IU';

SELECT *
FROM report
WHERE product = 'PS';

INSERT INTO report;

SYSTEM DROP  TABLE IF EXISTS replicated_report;

CREATE TABLE replicated_report
(
    product Enum8('IU' = 1, 'WS' = 2),
    machine String,
    branch String,
    generated_time DateTime
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/01747_alter_partition_key/t', '1')
ORDER BY (product, machine, branch, generated_time)
PARTITION BY (product, toYYYYMM(generated_time));

INSERT INTO replicated_report;

SELECT *
FROM replicated_report
WHERE product = 'IU';

SELECT *
FROM replicated_report
WHERE product = 'PS';

INSERT INTO replicated_report;