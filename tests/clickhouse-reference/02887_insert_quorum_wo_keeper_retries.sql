CREATE TABLE quorum1(x UInt32) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_02887/quorum', '1') ORDER BY x;
CREATE TABLE quorum2(x UInt32) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_02887/quorum', '2') ORDER BY x;
SET insert_keeper_fault_injection_probability=0;
SET insert_keeper_max_retries = 0;
SET insert_quorum = 2;
SELECT count() FROM quorum1;
