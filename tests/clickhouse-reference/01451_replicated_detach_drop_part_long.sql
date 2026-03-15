-- Tags: long, replica, no-replicated-database, no-shared-merge-tree
-- Tag no-replicated-database: Fails due to additional replicas or shards
-- no-shared-merge-tree: depends on max_replicated_merges_in_queue

SET replication_alter_partitions_sync = 2;
CREATE TABLE replica1 (v UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/'||currentDatabase()||'test/01451/attach', 'r1') order by tuple() settings max_replicated_merges_in_queue = 0;
CREATE TABLE replica2 (v UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/'||currentDatabase()||'test/01451/attach', 'r2') order by tuple() settings max_replicated_merges_in_queue = 0;
SELECT v FROM replica1 ORDER BY v;
SELECT name FROM system.detached_parts WHERE table = 'replica2' AND database = currentDatabase();
SELECT '-- drop part --';
SELECT name FROM system.parts WHERE table = 'replica2' AND active AND database = currentDatabase();
