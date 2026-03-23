-- Tags: long, no-shared-merge-tree
-- no-shared-merge-tree: depend on replication queue/fetches
SET insert_keeper_fault_injection_probability = 0; -- disable fault injection; part ids are non-deterministic in case of insert retries

CREATE TABLE rmt1
(
    n int
)
ENGINE = ReplicatedMergeTree('/test/02448/{database}/rmt', '1')
ORDER BY tuple()
SETTINGS min_replicated_logs_to_keep = 1, max_replicated_logs_to_keep = 2, max_cleanup_delay_period = 1, cleanup_delay_period = 0, cleanup_delay_period_random_add = 1, cleanup_thread_preferred_points_per_iteration = 0, old_parts_lifetime = 0, max_parts_to_merge_at_once = 4, merge_selecting_sleep_ms = 1000, max_merge_selecting_sleep_ms = 2000;

CREATE TABLE rmt2
(
    n int
)
ENGINE = ReplicatedMergeTree('/test/02448/{database}/rmt', '2')
ORDER BY tuple()
SETTINGS min_replicated_logs_to_keep = 1, max_replicated_logs_to_keep = 2, max_cleanup_delay_period = 1, cleanup_delay_period = 0, cleanup_delay_period_random_add = 1, cleanup_thread_preferred_points_per_iteration = 0, old_parts_lifetime = 0, max_parts_to_merge_at_once = 4, merge_selecting_sleep_ms = 1000, max_merge_selecting_sleep_ms = 2000;

INSERT INTO rmt1;

-- trigger log rotation, rmt1 will be lost
INSERT INTO rmt2;

INSERT INTO rmt2;

INSERT INTO rmt2;

INSERT INTO rmt2;

-- check that entry was not removed from the queue (part is not lost)
SET receive_timeout = 5;

SET receive_timeout = 300;

SELECT
    1,
    arraySort(groupArray(n))
FROM rmt2;

-- check that no parts are lost
SELECT
    2,
    arraySort(groupArray(n))
FROM rmt1;

SELECT
    3,
    arraySort(groupArray(n))
FROM rmt2;

INSERT INTO rmt2;

-- give it a chance to remove source parts
SELECT sleep(2)
FORMAT Null; -- increases probability of reproducing the issue

-- trigger log rotation, rmt2 will be lost
INSERT INTO rmt1;

INSERT INTO rmt1;

INSERT INTO rmt1;

SELECT
    4,
    arraySort(groupArray(n))
FROM rmt1;

-- check that no parts are lost
SELECT
    5,
    arraySort(groupArray(n))
FROM rmt1;

SELECT
    6,
    arraySort(groupArray(n))
FROM rmt2;

INSERT INTO rmt1;

-- trigger log rotation, rmt1 will be lost
INSERT INTO rmt2;

INSERT INTO rmt2;

INSERT INTO rmt2;

INSERT INTO rmt2;

SELECT
    7,
    arraySort(groupArray(n))
FROM rmt2;

-- check that no parts are lost
SELECT
    8,
    arraySort(groupArray(n))
FROM rmt1;

SELECT
    9,
    arraySort(groupArray(n))
FROM rmt2;

-- insert parts (all_18_18_0, all_19_19_0) on both replicas (will be deduplicated, but it does not matter)
INSERT INTO rmt1;

INSERT INTO rmt2;

INSERT INTO rmt1;

INSERT INTO rmt2;

-- create a gap in block numbers by dropping part
INSERT INTO rmt2;

INSERT INTO rmt2;

INSERT INTO rmt2;

INSERT INTO rmt2;

-- give it a chance to cleanup log
SELECT sleepEachRow(2)
FROM url(concat('http://localhost:8123/?param_tries={1..10}&query=', encodeURLComponent(concat('select value from system.zookeeper where path=''/test/02448/', currentDatabase(), '/rmt/replicas/1'' and name=''is_lost'' and value=''0'''))), 'LineAsString', 's String')
SETTINGS
    max_threads = 1,
    http_make_head_request = 0
FORMAT Null;

-- rmt1 should not show the value (200) from dropped part
SELECT throwIf(n = 200)
FROM rmt1
FORMAT Null;

SELECT
    11,
    arraySort(groupArray(n))
FROM rmt2;

SELECT
    12,
    arraySort(groupArray(n))
FROM rmt1;