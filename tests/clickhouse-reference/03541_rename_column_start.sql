-- Tags: zookeeper

CREATE TABLE rmt (a UInt64, b UInt64)
ENGINE=ReplicatedMergeTree('/clickhouse/tables/{database}/rmt', '1')
ORDER BY a;
INSERT INTO rmt VALUES (1, 4);
