-- Tags: zookeeper
DROP TABLE IF EXISTS empty1;

DROP TABLE IF EXISTS empty2;

CREATE TABLE empty1
(
    key UInt32,
    val UInt32,
    date Datetime
)
ENGINE = ReplicatedSummingMergeTree('/clickhouse/tables/{database}/test_01560_optimize_on_insert', '1', val)
ORDER BY key
PARTITION BY date;

CREATE TABLE empty2
(
    key UInt32,
    val UInt32,
    date Datetime
)
ENGINE = ReplicatedSummingMergeTree('/clickhouse/tables/{database}/test_01560_optimize_on_insert', '2', val)
ORDER BY key
PARTITION BY date;

INSERT INTO empty2;

SELECT *
FROM empty1
ORDER BY key ASC;

SELECT *
FROM empty2
ORDER BY key ASC;

SELECT
    table,
    `partition`,
    active
FROM `system`.parts
WHERE table = 'empty1'
    AND database = currentDatabase()
    AND active = 1;

SELECT
    table,
    `partition`,
    active
FROM `system`.parts
WHERE table = 'empty2'
    AND database = currentDatabase()
    AND active = 1;