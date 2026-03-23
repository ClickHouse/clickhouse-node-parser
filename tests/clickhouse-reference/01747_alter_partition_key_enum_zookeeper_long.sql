-- Tags: long, zookeeper

DROP TABLE IF EXISTS report;
CREATE TABLE report
(
    `product` Enum8('IU' = 1, 'WS' = 2),
    `machine` String,
    `branch` String,
    `generated_time` DateTime
)
ENGINE = MergeTree
PARTITION BY (product, toYYYYMM(generated_time))
ORDER BY (product, machine, branch, generated_time);
INSERT INTO report VALUES ('IU', 'lada', '2101', toDateTime('1970-04-19 15:00:00'));
SELECT * FROM report  WHERE product = 'IU';
SELECT * FROM report WHERE product = 'PS';
INSERT INTO report VALUES ('PS', 'jeep', 'Grand Cherokee', toDateTime('2005-10-03 15:00:00'));
DROP TABLE IF EXISTS replicated_report;
CREATE TABLE replicated_report
(
    `product` Enum8('IU' = 1, 'WS' = 2),
    `machine` String,
    `branch` String,
    `generated_time` DateTime
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/01747_alter_partition_key/t', '1')
PARTITION BY (product, toYYYYMM(generated_time))
ORDER BY (product, machine, branch, generated_time);
INSERT INTO replicated_report VALUES ('IU', 'lada', '2101', toDateTime('1970-04-19 15:00:00'));
SELECT * FROM replicated_report  WHERE product = 'IU';
SELECT * FROM replicated_report WHERE product = 'PS';
INSERT INTO replicated_report VALUES ('PS', 'jeep', 'Grand Cherokee', toDateTime('2005-10-03 15:00:00'));
