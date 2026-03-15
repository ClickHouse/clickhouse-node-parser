-- Tags: long, replica, no-replicated-database, no-shared-merge-tree, no-async-insert
-- no-shared-merge-tree: depends on max_replicated_merges_in_queue
-- Tag no-async-insert: async inserts with quorum inserts are only have sence with enabled quorum_parallel setting

SET replication_alter_partitions_sync = 2;
CREATE TABLE replica1 (v UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/01451/quorum', 'r1') order by tuple() settings max_replicated_merges_in_queue = 0;
CREATE TABLE replica2 (v UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/01451/quorum', 'r2') order by tuple() settings max_replicated_merges_in_queue = 0;
SELECT name FROM system.parts WHERE table = 'replica2' and database = currentDatabase() and active = 1;
SELECT * FROM replica1;
SELECT * FROM replica2;
SET insert_quorum = 2, insert_quorum_parallel = 0;
SELECT name FROM system.parts WHERE table = 'replica1' and database = currentDatabase() and active = 1 ORDER BY name;
SELECT COUNT() FROM replica1;
SET insert_quorum_parallel=1;
