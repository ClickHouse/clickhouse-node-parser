-- Tags: long, zookeeper, no-replicated-database, no-shared-merge-tree, no-async-insert
-- Tag no-replicated-database: Fails due to additional replicas or shards
-- Tag no-shared-merge-tree: no-shared-merge-tree: No quorum
-- Tag no-async-insert: async inserts with quorum inserts are only have sence with enabled quorum_parallel setting

SET send_logs_level = 'fatal';
CREATE TABLE quorum1(x UInt32, y Date) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_00732/quorum_old_data', '1') ORDER BY x PARTITION BY y;
CREATE TABLE quorum2(x UInt32, y Date) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_00732/quorum_old_data', '2') ORDER BY x PARTITION BY y;
SET select_sequential_consistency=1;
SET insert_quorum=2, insert_quorum_parallel=0;
SET insert_quorum_timeout=0;
SELECT x FROM quorum1 ORDER BY x;
SELECT x FROM quorum2 ORDER BY x;
