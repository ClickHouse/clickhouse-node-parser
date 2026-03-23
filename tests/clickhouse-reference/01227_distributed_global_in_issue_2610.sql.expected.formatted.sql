-- Tags: distributed
-- Test from the issue https://github.com/ClickHouse/ClickHouse/issues/2610
SYSTEM drop  table if exists data_01227;

CREATE TABLE data_01227
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

INSERT INTO data_01227 SELECT *
FROM numbers(10);

SELECT *
FROM remote('127.1', currentDatabase(), data_01227)
PREWHERE key GLOBAL IN (
        SELECT key
        FROM data_01227
        PREWHERE key = 2
    );

SELECT *
FROM cluster('test_cluster_two_shards', currentDatabase(), data_01227)
PREWHERE key GLOBAL IN (
        SELECT key
        FROM data_01227
        PREWHERE key = 2
    );

SYSTEM drop  table data_01227;