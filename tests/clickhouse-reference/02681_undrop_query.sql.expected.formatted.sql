-- Tags: no-ordinary-database, no-replicated-database, distributed, zookeeper
SET database_atomic_wait_for_drop_and_detach_synchronously = 0;

CREATE TABLE `02681_undrop_mergetree`
(
    id Int32
)
ENGINE = MergeTree()
ORDER BY id;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_mergetree'
LIMIT 1;

SELECT *
FROM `02681_undrop_mergetree`
ORDER BY id ASC;

CREATE TABLE `02681_undrop_detach`
(
    id Int32,
    num Int32
)
ENGINE = MergeTree()
ORDER BY id;

SELECT command
FROM `system`.mutations
WHERE table = '02681_undrop_detach'
    AND database = currentDatabase()
LIMIT 1;

CREATE TABLE `02681_undrop_uuid_on_cluster` ON CLUSTER test_shard_localhost
(
    id Int32
)
ENGINE = MergeTree()
ORDER BY id
FORMAT Null;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_uuid_on_cluster'
LIMIT 1;

SELECT *
FROM `02681_undrop_uuid_on_cluster`
ORDER BY id ASC;

CREATE TABLE `02681_undrop_no_uuid_on_cluster` ON CLUSTER test_shard_localhost
(
    id Int32
)
ENGINE = MergeTree()
ORDER BY id
FORMAT Null;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_no_uuid_on_cluster'
LIMIT 1;

SELECT *
FROM `02681_undrop_no_uuid_on_cluster`
ORDER BY id ASC;

CREATE TABLE `02681_undrop_replicatedmergetree`
(
    id Int32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02681_undrop_replicatedmergetree', 'test_undrop')
ORDER BY id;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_replicatedmergetree'
LIMIT 1;

SELECT *
FROM `02681_undrop_replicatedmergetree`
ORDER BY id ASC;

CREATE TABLE `02681_undrop_log`
(
    id Int32
)
ENGINE = Log();

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_log'
LIMIT 1;

SELECT *
FROM `02681_undrop_log`
ORDER BY id ASC;

CREATE TABLE `02681_undrop_distributed`
(
    id Int32
)
ENGINE = Distributed(test_shard_localhost, currentDatabase(), `02681_undrop`, rand());

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_distributed'
LIMIT 1;

CREATE TABLE `02681_undrop_multiple`
(
    id Int32
)
ENGINE = MergeTree()
ORDER BY id;

SELECT table
FROM `system`.dropped_tables
WHERE table = '02681_undrop_multiple'
LIMIT 1;

SELECT *
FROM `02681_undrop_multiple`
ORDER BY id ASC;