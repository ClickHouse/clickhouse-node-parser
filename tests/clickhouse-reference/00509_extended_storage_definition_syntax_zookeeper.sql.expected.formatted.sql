-- Tags: zookeeper, no-shared-merge-tree
-- no-shared-merge-tree: boring test, nothing new
SET optimize_on_insert = 0;

CREATE TABLE replicated_with_sampling
(
    x UInt8
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00509/replicated_with_sampling', 'r1')
ORDER BY x
SAMPLE BY x;

SELECT sum(x)
FROM replicated_with_sampling SAMPLE 1/2;

CREATE TABLE replacing
(
    d Date,
    x UInt32,
    s String
)
ENGINE = ReplacingMergeTree
ORDER BY x
PARTITION BY d;

SELECT *
FROM replacing;

CREATE TABLE replicated_collapsing
(
    d Date,
    x UInt32,
    sign Int8
)
ENGINE = ReplicatedCollapsingMergeTree('/clickhouse/tables/{database}/test_00509/replicated_collapsing', 'r1', sign)
ORDER BY d
PARTITION BY toYYYYMM(d);

SELECT *
FROM replicated_collapsing;

CREATE TABLE replicated_versioned_collapsing
(
    d Date,
    x UInt32,
    sign Int8,
    version UInt8
)
ENGINE = ReplicatedVersionedCollapsingMergeTree('/clickhouse/tables/{database}/test_00509/replicated_versioned_collapsing', 'r1', sign, version)
ORDER BY (d, version)
PARTITION BY toYYYYMM(d);

SELECT *
FROM replicated_versioned_collapsing;

CREATE TABLE with_settings
(
    x UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00509/with_settings', 'r1')
ORDER BY x
SETTINGS replicated_can_become_leader = 0;

SELECT sleep(1); -- If replicated_can_become_leader were true, this replica would become the leader after 1 second.

SELECT is_leader
FROM `system`.replicas
WHERE database = currentDatabase()
    AND table = 'with_settings';