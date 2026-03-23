-- Tags: long, zookeeper, no-replicated-database, no-async-insert
-- Tag no-replicated-database: Fails due to additional replicas or shards
-- Tag no-async-insert: async inserts with quorum inserts are only have sence with enabled quorum_parallel setting
DROP TABLE IF EXISTS mutations_and_quorum1;

DROP TABLE IF EXISTS mutations_and_quorum2;

CREATE TABLE mutations_and_quorum1
(
    server_date Date,
    something String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01090/mutations_and_quorum', '1')
ORDER BY (server_date, something)
PARTITION BY toYYYYMM(server_date);

CREATE TABLE mutations_and_quorum2
(
    server_date Date,
    something String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01090/mutations_and_quorum', '2')
ORDER BY (server_date, something)
PARTITION BY toYYYYMM(server_date);

-- Should not be larger then 600e6 (default timeout in clickhouse-test)
SET insert_quorum = 2, insert_quorum_parallel = 0, insert_quorum_timeout = 300e3;

INSERT INTO mutations_and_quorum1;

SELECT COUNT()
FROM mutations_and_quorum1;

SELECT COUNT()
FROM mutations_and_quorum2;

SELECT COUNT()
FROM `system`.mutations
WHERE database = currentDatabase()
    AND like(table, 'mutations_and_quorum%')
    AND is_done = 0;