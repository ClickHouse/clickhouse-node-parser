CREATE TABLE mutations_and_quorum1 (`server_date` Date, `something` String) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01090/mutations_and_quorum', '1') PARTITION BY toYYYYMM(server_date) ORDER BY (server_date, something);
CREATE TABLE mutations_and_quorum2 (`server_date` Date, `something` String) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01090/mutations_and_quorum', '2') PARTITION BY toYYYYMM(server_date) ORDER BY (server_date, something);
-- Should not be larger then 600e6 (default timeout in clickhouse-test)
SET insert_quorum=2, insert_quorum_parallel=0, insert_quorum_timeout=300e3;
SELECT COUNT() FROM mutations_and_quorum1;
SELECT COUNT() FROM mutations_and_quorum2;
SELECT COUNT() FROM system.mutations WHERE database = currentDatabase() AND table like 'mutations_and_quorum%' and is_done = 0;
