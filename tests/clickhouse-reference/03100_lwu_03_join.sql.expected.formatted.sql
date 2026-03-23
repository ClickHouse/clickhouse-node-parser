-- Tags: no-parallel-replicas, no-replicated-database, long
-- no-parallel-replicas: profile events may differ with parallel replicas.
-- no-replicated-database: fails due to additional shard.
SET insert_keeper_fault_injection_probability = 0.0;

SET enable_lightweight_update = 1;

SYSTEM DROP  TABLE IF EXISTS t_shared SYNC;

CREATE TABLE t_shared
(
    id UInt64,
    c1 UInt64
)
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_shared/', '1')
ORDER BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1, apply_patches_on_merge = 0;

INSERT INTO t_shared;

SELECT
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_shared'
    AND active
ORDER BY name ASC;

SELECT *
FROM t_shared
ORDER BY id ASC;

INSERT INTO t_shared;

SYSTEM DROP  TABLE t_shared SYNC;

SELECT mapSort(mapFilter((k, v) -> k IN ('ReadTasksWithAppliedPatches', 'PatchesAppliedInAllReadTasks', 'PatchesMergeAppliedInAllReadTasks', 'PatchesJoinAppliedInAllReadTasks'), ProfileEvents))
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, '%SELECT * FROM t_shared ORDER BY id%')
    AND type = 'QueryFinish'
ORDER BY event_time_microseconds ASC;